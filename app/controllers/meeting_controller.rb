class MeetingController < ApplicationController
  before_action :set_meeting, only: %i[destroy]

  def create
    @meeting = Meeting.new(meeting_params)

    respond_to { |format| @meeting.save if @meeting.valid? }
  end

  def destroy
    @meeting.destroy
    respond_to { |format| format.js { render inline: "location.reload();" } }
  end

  def show
    redirect_to root_path if !user_signed_in? || current_user.id != params[:id].to_i
    @meetings = Meeting.where(user_id: params[:id])
    if Seller.find_by(user_id: params[:id]) && @meetings.length == 0
      @meetings = Meeting.where(seller_id: Seller.find_by(user_id: params[:id]).id)
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
