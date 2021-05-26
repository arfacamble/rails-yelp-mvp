class ReviewsController < ApplicationController
  before_action :set_restaurant

  def create
    @review = Review.new review_params
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      raise
      redirect_to restaurant_path(@restaurant), { notice: 'incorrect form entry', class: 'alert alert-danger' }
      # render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
