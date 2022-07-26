class UserController < ApplicationController
  def profile
    return if !user_signed_in?
    @profile = User.find(current_user.id)
    @insertions = Insertion.where(seller_id: Seller.find_by(user_id: current_user.id).id)
  end

  def cart
    return if !user_signed_in?
    @cart = Cart.where(user_id: current_user.id)
  end
  
  def wishlist
    return if !user_signed_in?
    @wishlist = Wishlist.where(user_id: current_user.id)
  end

  def user_to_seller
    if user_signed_in? and current_user.id == params[:id].to_i
      seller = Seller.find_by(user_id: params[:id])
      if !seller
        seller = Seller.create(user: User.find(params[:id]))
      else
        seller.update(active: !seller.active)
      end
      respond_to { |format| format.js { render inline: "location.reload();" } }
    end
  end
  
  def seller_to_user
    if user_signed_in? and current_user.id == params[:id].to_i
      seller = Seller.find_by(user_id: params[:id])
      seller.update(active: !seller.active)
      respond_to { |format| format.js { render inline: "location.reload();" } }
    end
  end
  
  def add_to_cart
    if user_signed_in?
      Cart.create(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
      respond_to { |format| format.html { redirect_to root_path } }
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
      respond_to { |format| format.html { redirect_to root_path } }
    end
  end
  
  def remove_to_wishlist
    if user_signed_in?
      Wishlist.destroy_by(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
      respond_to { |format| format.js { render inline: "location.reload();" } }
    end
  end
end
