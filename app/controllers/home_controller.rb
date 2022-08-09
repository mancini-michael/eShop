class HomeController < ApplicationController

  # * DONE
  def index
    @insertions = Insertion.all
    @latest_insertions = Insertion.order(:timestamp).reverse.first(5)

    if user_signed_in?
      @seller = Seller.find_by(user_id: current_user)

      if @seller 
        @insertions = @insertions.filter { |insertion| insertion.seller_id != @seller.id }
        @latest_insertions = @latest_insertions.filter { |insertion| insertion.seller_id != @seller.id }
      end
    end
  end

  def get_home
    return @insertions = Insertion.where(categories: params[:category]) if params[:category]
  end
end
