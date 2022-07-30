class UserController < ApplicationController
  before_action :set_user, only: %i[profile cart wishlist user_to_seller seller_to_user]

  def profile
    if seller = Seller.find_by(user_id: @user)
      @insertions = Insertion.where(seller_id: seller).order(:timestamp).reverse.first(4)
      @reviews = Review.where(seller_id: seller).order(:timestamp).reverse.first(4)
    end
  end

  def cart
    redirect_to root_path if !user_signed_in? || current_user.id != params[:id].to_i
    @cart = Cart.where(user_id: @user)
  end
  
  def wishlist
    redirect_to root_path if !user_signed_in? || current_user.id != params[:id].to_i
    @wishlist = Wishlist.where(user_id: @user)
  end

  def user_to_seller
    if user_signed_in? and current_user.id == params[:id].to_i
      seller = Seller.find_by(user_id: @user)
      if !seller
        seller = Seller.create(user: User.find(@user.id))
      else
        seller.update(active: !seller.active)
      end
      respond_to { |format| format.js { render inline: "location.reload();" } }
    end
  end
  
  def seller_to_user
    if user_signed_in? and current_user.id == params[:id].to_i
      seller = Seller.find_by(user_id: @user)
      seller.update(active: !seller.active)
      respond_to { |format| format.js { render inline: "location.reload();" } }
    end
  end
  
  def add_to_cart
    if user_signed_in?
      Cart.create(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
      respond_to { |format| format.js { render inline: "location.reload();" } }
    end
  end
  
  def remove_to_cart
    if user_signed_in?
      Cart.destroy_by(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
      respond_to { |format| format.js { render inline: "location.reload();" } }
    end
  end
  
  def add_to_wishlist
    if user_signed_in?
      Wishlist.create(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
      respond_to { |format| format.js { render inline: "location.reload();" } }
    end
  end
  
  def remove_to_wishlist
    if user_signed_in?
      Wishlist.destroy_by(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
      respond_to { |format| format.js { render inline: "location.reload();" } }
    end
  end

  private 

  def set_user
    @user = User.find(params[:id])
  end
end
