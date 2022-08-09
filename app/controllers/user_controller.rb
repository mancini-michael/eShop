class UserController < ApplicationController
  before_action :set_user, only: %i[profile cart wishlist]

  # * DONE
  def profile
    @seller = Seller.find_by(user_id: @user)
    
    if @seller
      @insertions = Insertion.where(seller_id: @seller).order(:timestamp).reverse.first(4)
      @sold_insertions = History.where(seller_id: @seller).order(:timestamp).reverse.first(4)
      @reviews = Review.where(seller_id: @seller).order(:timestamp).reverse.first(4)
    end
  end

  # * DONE
  def cart
    redirect_to root_path if !user_signed_in? || current_user.id != params[:id].to_i
    @cart = Cart.where(user_id: @user)
  end
  
  # * DONE
  def wishlist
    redirect_to root_path if !user_signed_in? || current_user.id != params[:id].to_i
    @wishlist = Wishlist.where(user_id: @user)
  end

  private 

  # * DONE
  def set_user
    @user = User.find(params[:id])
  end
end
