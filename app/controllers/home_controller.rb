class HomeController < ApplicationController
  before_action :get_insertion, only: %i[index]

  def index
  end

  def user_to_seller
    if user_signed_in? and current_user.id == params[:id].to_i
      seller = Seller.find_by(user_id: params[:id])
      if !seller
        seller = Seller.create(user: User.find(params[:id]))
      else
        seller.update(active: !seller.active)
      end
      respond_to { |format| format.html { redirect_to root_path } }
    end
  end

  def seller_to_user
    if user_signed_in? and current_user.id == params[:id].to_i
      seller = Seller.find_by(user_id: params[:id])
      seller.update(active: !seller.active)
      respond_to { |format| format.html { redirect_to root_path } }
    end
  end

  private

  def get_insertion
    return @insertions = Insertion.where(categories: params[:category]) if params[:category]
    @insertions = Insertion.all
    @latest = Insertion.order(:timestamp).reverse.first(5)
  end
end
