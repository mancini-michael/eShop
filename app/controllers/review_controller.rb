class ReviewController < ApplicationController
  before_action :sanitize_review_params
  before_action :set_review, only: %i[edit destroy]

  def create
    @review = Review.new(review_params)

    respond_to { |format| @review.save if @review.valid? }
  end

  def edit
  end

  def destroy
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:user_id, :seller_id, :rating)
  end
end
