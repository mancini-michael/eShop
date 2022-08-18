require "google/apis/calendar_v3"
require "opencage/geocoder"

class MeetingController < ApplicationController
  before_action :set_meeting, only: %i[accept destroy update]

  def new
    @insertion = Insertion.find(params[:id])
    @seller = Seller.find(@insertion.seller_id)
    @user = User.find(@seller.user_id)

    geocoder = OpenCage::Geocoder.new(api_key: Rails.application.credentials.dig(:opencage_api))
    results = geocoder.geocode("#{@user.address}, #{@user.city}")
    gon.lat = results.first.coordinates[0]
    gon.lng = results.first.coordinates[1]
  end

  def accept
    # update or create Google Calendar event if user is logged with Google Account
    if current_user.provider == "google_oauth2"      
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = session[:access_token]
      event = Google::Apis::CalendarV3::Event.new(
        summary: Insertion.find(@meeting.insertion_id).title,
        location: @meeting.place,
        description: Insertion.find(@meeting.insertion_id).description,
        start: Google::Apis::CalendarV3::EventDateTime.new(
          date_time: @meeting.date.to_datetime,
          time_zone: "Europe/Rome"
        ),
      end: Google::Apis::CalendarV3::EventDateTime.new(
          date_time: @meeting.date.to_datetime,
          time_zone: "Europe/Rome"
        ),
        attendees: [
          Google::Apis::CalendarV3::EventAttendee.new(
            email: User.find(@meeting.user_id).email
          ),
          Google::Apis::CalendarV3::EventAttendee.new(
            email: User.find(Seller.find(@meeting.seller_id).user_id).email
          )
        ],
      )
      
      if @meeting.calendar_id == ""
        event_created = service.insert_event("primary", event)    
        @meeting.calendar_id = event_created.id
      else
        service.update_event("primary", @meeting.calendar_id, event)
      end
    end

    if ActiveModel::Type::Boolean.new.cast(params[:owner])
      @meeting.update_attribute(:seller_approvation, true)
    else
      @meeting.update_attribute(:user_approvation, true)
    end

    respond_to { |format| format.js { render inline: "location.reload();" } }
  end
  
  def create
    @meeting = Meeting.new(meeting_params)

    geocoder = OpenCage::Geocoder.new(api_key: Rails.application.credentials.dig(:opencage_api))
    results = geocoder.geocode(@meeting.place) if @meeting.place != ""
    
    # create Google Calendar event if user is logged with Google Account
    if results && results.length > 0 && current_user.provider == "google_oauth2"
      event = Google::Apis::CalendarV3::Event.new(
        summary: Insertion.find(@meeting.insertion_id).title,
        location: @meeting.place,
        description: Insertion.find(@meeting.insertion_id).description,
        start: Google::Apis::CalendarV3::EventDateTime.new(
          date_time: @meeting.date.to_datetime,
          time_zone: "Europe/Rome"
        ),
        end: Google::Apis::CalendarV3::EventDateTime.new(
          date_time: @meeting.date.to_datetime,
          time_zone: "Europe/Rome"
        ),
        attendees: [
          Google::Apis::CalendarV3::EventAttendee.new(
            email: User.find(@meeting.user_id).email
          ),
          Google::Apis::CalendarV3::EventAttendee.new(
            email: User.find(Seller.find(@meeting.seller_id).user_id).email
          )
        ],
      )

      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = session[:access_token]

      event_created = service.insert_event("primary", event)    
      @meeting.calendar_id = event_created.id
    end

    respond_to do |format| 
      if @meeting.save
        format.html { redirect_to show_meeting_path(current_user) }
      else
        format.html { redirect_to insertion_path(@meeting.insertion_id), alert: "Errore nella prenotazione, campi non validi" }
      end
    end
  end

  def destroy
    if current_user.provider == "google_oauth2"
      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = session[:access_token]
      
      if @meeting.calendar_id != "" && service.get_event("primary", @meeting.calendar_id).status != "cancelled"
        service.delete_event("primary", @meeting.calendar_id)
      end
    end

    @meeting.destroy
    respond_to { |format| format.js { render inline: "location.reload();" } }
  end

  def show
    redirect_to root_path if !user_signed_in? || current_user.id != params[:id].to_i

    @seller = Seller.find_by(user_id: current_user)
    @geocoder = OpenCage::Geocoder.new(api_key: Rails.application.credentials.dig(:opencage_api))
    @meetings = Meeting.where(user_id: params[:id])
    
    if Seller.find_by(user_id: params[:id]) && @meetings.length == 0
      @meetings = Meeting.where(seller_id: Seller.find_by(user_id: params[:id]).id)
    end
  end

  def update
    # @meeting.update_attribute(:date, params[:meeting][:date])
    # @meeting.update_attribute(:place, params[:meeting][:place])

    if ActiveModel::Type::Boolean.new.cast(params[:meeting][:owner])
      @meeting.update_attribute(:user_approvation, false)
      @meeting.update_attribute(:seller_approvation, true)
    else
      @meeting.update_attribute(:user_approvation, true)
      @meeting.update_attribute(:seller_approvation, false)
    end

    respond_to do |format| 
      if @meeting.update(meeting_params)
        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = session[:access_token]

        if current_user.provider == "google_oauth2" && service.get_event("primary", @meeting.calendar_id).status != "cancelled"    
          event = Google::Apis::CalendarV3::Event.new(
            summary: Insertion.find(@meeting.insertion_id).title,
            location: @meeting.place,
            description: Insertion.find(@meeting.insertion_id).description,
            start: Google::Apis::CalendarV3::EventDateTime.new(
              date_time: @meeting.date.to_datetime,
              time_zone: "Europe/Rome"
            ),
          end: Google::Apis::CalendarV3::EventDateTime.new(
              date_time: @meeting.date.to_datetime,
              time_zone: "Europe/Rome"
            ),
            attendees: [
              Google::Apis::CalendarV3::EventAttendee.new(
                email: User.find(@meeting.user_id).email
              ),
              Google::Apis::CalendarV3::EventAttendee.new(
                email: User.find(Seller.find(@meeting.seller_id).user_id).email
              )
            ],
          )
          
          if @meeting.calendar_id == ""
            event_created = service.insert_event("primary", event)    
            @meeting.calendar_id = event_created.id
          else
            service.update_event("primary", @meeting.calendar_id, event)
          end
        end

        format.js { render inline: "location.reload();" } 
      else
        format.html { redirect_to show_meeting_path(params[:id]), alert: "Errore nella modifica della prenotazione" }
      end
    end
  end

  private

  def set_meeting
    @meeting = Meeting.find(params[:id])
  end

  def meeting_params
    params.require(:meeting).permit(:user_id, :seller_id, :insertion_id, :date, :place)
  end
end
