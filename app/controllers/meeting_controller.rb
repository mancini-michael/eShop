class MeetingController < ApplicationController
  def create
    @meeting = Meeting.new(meeting_params)

    respond_to { |format| @meeting.save if @meeting.valid? }
  end

  private

  def meeting_params
    params.require(:meeting).permit(:user_id, :seller_id, :insertion_id, :date, :place)
  end
end
