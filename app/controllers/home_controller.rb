class HomeController < ApplicationController
  before_action :get_home, only: %i[index]

  # * DONE
  def index
    @seller = Seller.find_by(user_id: current_user) if user_signed_in?
  end

  private

  def get_home
    return @insertions = Insertion.where(categories: params[:category]) if params[:category]
    @insertions = Insertion.all
    @latest = Insertion.order(:timestamp).reverse.first(5)
  end
end
