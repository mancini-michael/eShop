class HomeController < ApplicationController
  # * DONE
  def index
    @insertions = Insertion.all
    @latest_insertions = Insertion.order(:timestamp).reverse.first(5)

    if user_signed_in?
      @seller = Seller.find_by(user_id: current_user)
      @cart = Cart.where(user_id: current_user)
      @wishlist = Wishlist.where(user_id: current_user)

      if @seller 
        @insertions = @insertions.filter { |insertion| insertion.seller_id != @seller.id }
        @latest_insertions = @latest_insertions.filter { |insertion| insertion.seller_id != @seller.id }
      end
    end

    @category = params[:category]
    @insertions = @insertions.filter { |insertion| insertion.categories == @category } if @category
  end
end
