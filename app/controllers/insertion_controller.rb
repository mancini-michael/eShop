require 'opencage/geocoder'

class InsertionController < ApplicationController
  before_action :sanitize_insertion_params
  before_action :set_insertion, only: %i[show edit destroy]

  def show 
    user = User.find(Seller.find(@insertion.seller_id).user_id)
    geocoder = OpenCage::Geocoder.new(api_key: Rails.application.credentials.dig(:maps_api))
    results = geocoder.geocode("#{User.find(Seller.find(@insertion.seller_id).user_id).address}, #{User.find(Seller.find(@insertion.seller_id).user_id).city}")
    gon.lat = results.first.coordinates[0]
    gon.lng = results.first.coordinates[1]
    @questions = Question.where(insertion_id: params[:id]).limit(5)
  end

  def create
    params[:insertion][:categories] = params[:insertion][:categoris].to_i
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

  def search
    @insertion = Insertion.where("title like ?", "%#{params[:search]}%") if params[:search] != ""
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
