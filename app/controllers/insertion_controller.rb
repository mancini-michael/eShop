require "opencage/geocoder"

class InsertionController < ApplicationController
  before_action :sanitize_insertion_params
  before_action :set_insertion, only: %i[show edit destroy]

  # * DONE
  def show
    @questions = Question.where(insertion_id: @insertion).limit(5)
    user = User.find(Seller.find(@insertion.seller_id).user_id)
    
    if user_signed_in?
      @cart = Cart.where(user_id: current_user)
      @seller = Seller.find_by(user_id: current_user)
      @wishlist = Wishlist.where(user_id: current_user)
    end

    geocoder = OpenCage::Geocoder.new(api_key: Rails.application.credentials.dig(:opencage_api))
    results = geocoder.geocode("#{user.address}, #{user.city}")
    gon.lat = results.first.coordinates[0]
    gon.lng = results.first.coordinates[1]
  end

  def create
    params[:insertion][:categories] = params[:insertion][:categories].to_i
    @insertion = Insertion.new(insertion_params)

    respond_to { |format| @insertion.save if @insertion.valid? }
  end
  
  def edit
    params[:insertion][:categories] = params[:insertion][:categories].to_i

    respond_to do |format|
      if @insertion.update(insertion_params)
        respond_to { |format| render inline: "location.reload();" }
      end
    end
  end
  
  def destroy
    @insertion.destroy
    
    respond_to { |format| format.js { render inline: "location.reload();" } }
  end

  # * DONE
  def search
    @seller = Seller.find_by(user_id: current_user)
    
    if params[:search] != ""
      @insertions = Insertion.where("title like ?", "%#{params[:search]}%")
      
      if user_signed_in?
        @cart = Cart.where(user_id: current_user)
        @wishlist = Wishlist.where(user_id: current_user)

        @insertions = @insertions.filter { |insertion| insertion.seller_id != @seller.id } if @seller
      end
    end
  end

  private
  
  # * DONE
  def set_insertion
    @insertion = Insertion.find(params[:id])
  end
  
  # * DONE
  def sanitize_insertion_params
    params[:id] = params[:id].to_i
  end
  
  # * DONE
  def insertion_params
    params.require(:insertion).permit(:seller_id, :image, :title, :description, :price, :categories)
  end
end
