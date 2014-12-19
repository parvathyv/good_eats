class RestaurantsController < ApplicationController

  # GET /restaurants
  def index
    @restaurants = Restaurant.order(id: :DESC)
  end

  # GET /restaurants/1
  def show
    
    @restaurant = Restaurant.find(params[:id])
    
    @review= Review.new
    
    @reviews = Review.where('restaurant_id =?', params[:id])
   
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # POST /restaurants
  def create
  
   
    @restaurant= Restaurant.new(restaurant_params)
  

    if @restaurant.save
      redirect_to new_restaurant_path, notice: 'Restaurant was successfully created.'
    else
      render action: 'new'
    end
  
  end
  
=begin
  def destroy

    @restaurant = Restaurant.find(params[:id]).destroy
    redirect_to @restaurant, notice: 'Restaurant was successfully deleted'
  end  
 

  def edit
  
     @restaurant = Restaurant.find(params[:id])
    
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    
    @restaurant.update(question_params)

  
    if @restaurant.save
      redirect_to @restaurant, notice: 'Restaurant was successfully created.'
    else
      render action: 'edit'
    end
  end  
=end  
  

  
  #private

  # Never trust parameters from the scary internet, only allow the white list through.
  def restaurant_params
    params.require(:restaurant).permit(:name, :body, :state, :zip, :city, :address, :category, :description)
  end
end
