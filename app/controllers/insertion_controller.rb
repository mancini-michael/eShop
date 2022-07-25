class InsertionController < ApplicationController
  before_action :sanitize_insertion_params
  before_action :set_insertion, only: %i[show edit destroy]

  def show 
    @seller_id = Insertion.find(params[:id]).seller_id
    @user_id = Seller.find(@seller_id).user_id
    gon.lat = User.find(@user_id).location[0]
    gon.lng = User.find(@user_id).location[1]
  end

  def create
    @insertion = Insertion.new(insertion_params)

    respond_to { |format| @insertion.save if @insertion.valid? }
  end

  def edit
  end

  def destroy
  end

  private

  def set_insertion
    @insertion = Insertion.find(params[:id])
  end

  def sanitize_insertion_params
    params[:id] = params[:id].to_i
  end

  def insertion_params
    params.require(:insertion).permit(:seller_id, :title, :description, :price, :categories)
  end
end
