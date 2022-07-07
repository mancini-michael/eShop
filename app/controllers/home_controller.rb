class HomeController < ApplicationController
  def index
  end

  def user_to_seller
    if user_signed_in?
      seller = Seller.create(user: User.find(params[:id]))
      respond_to do |format|
        format.html { redirect_to root_path } if seller.save
      end
    end
  end

  def seller_to_user
    if user_signed_in?
      seller = Seller.find_by(user_id: params[:id])
      seller.update(active: !seller.active)
      respond_to { |format| format.html { redirect_to root_path } }
    end
  end
end
