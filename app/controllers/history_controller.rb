class HistoryController < ApplicationController
  def complete
    
    insertion = Insertion.find(params[:insertion])
    seller = Seller.find(params[:seller])
    user = User.find(params[:user])
    
    history = History.create(insertion: insertion, seller: seller, user: user, date: params[:date], place: params[:place])
    insertion.update_attribute(:sold, true)
    Meeting.find(params[:id]).destroy
    
    respond_to { |format| format.js { render inline: "location.reload();" } }
  end
end
