module Api  
  class ApiController < ApplicationController
    
    # * DONE
    # API for update user to seller role
    def user_to_seller
      if user_signed_in? and current_user.id == params[:id].to_i
        seller = Seller.find_by(user_id: current_user)

        if !seller
          seller = Seller.create(user: User.find(current_user))
        else
          seller.update(active: !seller.active)
        end

        respond_to { |format| format.js { render inline: "location.reload();" } }
      else
        respond_to { head :unauthorized  }
      end
    end
    
    # * DONE
    # API for update seller to user role
    def seller_to_user
      if user_signed_in? and current_user.id == params[:id].to_i
        seller = Seller.find_by(user_id: current_user)
        seller.update(active: !seller.active)

        respond_to { |format| format.js { render inline: "location.reload();" } }
      else
        respond_to { head :unauthorized  }
      end
    end
    
    # * DONE
    # API for add insertion to user's cart
    def add_to_cart
      if user_signed_in?
        Cart.create(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
        respond_to { |format| format.js { render inline: "location.reload();" } }
      else
        respond_to { head :unauthorized  }
      end
    end
    
    # * DONE
    # API for remove insertion to user's cart
    def remove_to_cart
      if user_signed_in?
        Cart.destroy_by(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
        respond_to { |format| format.js { render inline: "location.reload();" } }
      else
        respond_to { |format| head :unauthorized }
      end
    end
    
    # * DONE
    # API for add insertion to user's wishlist
    def add_to_wishlist
      if user_signed_in?
        Wishlist.create(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
        respond_to { |format| format.js { render inline: "location.reload();" } }
      else
        respond_to { |format| head :unauthorized }
      end
    end
    
    # * DONE
    # API for remove insertion to user's wishlist
    def remove_to_wishlist
      if user_signed_in?
        Wishlist.destroy_by(user: User.find(current_user.id), insertion: Insertion.find(params[:insertion]))
        respond_to { |format| format.js { render inline: "location.reload();" } }
      else
        respond_to { |format| head :unauthorized }
      end
    end
  end
end