class InsertionController < ApplicationController
  before_action :sanitize_insertion_params
  before_action :set_insertion, only: %i[show edit destroy]

  def show 
    user = User.find(Seller.find(@insertion.seller_id).user_id)
    gon.lat = user.location[0]
    gon.lng = user.location[1]
    @questions = Question.where(insertion_id: params[:id])
  end

  def create
    params[:insertion][:categories] = params[:insertion][:categoris].to_i
    @insertion = Insertion.new(insertion_params)

    respond_to { |format| @insertion.save if @insertion.valid? }
  end

  def edit
    respond_to do |format|
      if @insertion.update(insertion_params)
        respond_to { |format| @insertion.update(insertion_params) }
      end
    end
  end
  
  def destroy
    @insertion.destroy

    respond_to { |format| format.js { render inline: "location.reload();" } }
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
