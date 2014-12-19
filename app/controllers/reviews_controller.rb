
class ReviewsController < ApplicationController

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  def show
    @review = Review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = Review.new
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  # POST /reviews
  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = @restaurant.reviews.build(review_params)
    if @review.save
      redirect_to new_restaurant_review_path(@restaurant), notice: 'Review was successfully created.'
    else
      redirect_to new_restaurant_review_path(@restaurant), notice: 'Review was not created.'
    end
  end


  #private

  # Never trust parameters from the scary internet, only allow the white list through.
  def review_params
    params.require(:review).permit(:body, :rating)
  end

end
