class HomeController < ApplicationController
  def index
  end

  def show
    @insertions = Insertion.where(categories: params[:category])
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
end
