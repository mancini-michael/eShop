class ReviewController < ApplicationController
  before_action :sanitize_review_params
  before_action :set_review, only: %i[edit destroy]

  def create
    @review = Review.new(review_params)

    redirect_to "/profile/"+current_user.id.to_s
  end

  def edit
  end

  def destroy
  end

  private

  def sanitize_review_params
    params[:review][:user_id] = params[:review][:user_id].to_i
    params[:review][:seller_id] = params[:review][:seller_id].to_i
    params[:review][:rating] = params[:review][:rating].to_i
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :seller_id, :rating)
  end
end
