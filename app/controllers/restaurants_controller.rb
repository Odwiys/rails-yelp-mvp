class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    # if @review.save # Will raise ActiveModel::ForbiddenAttributesError
    #   redirect_to restaurant_path(@restaurant)
    # else
    #   render :new, status: :unprocessable_entity
    # end
  end

  def new
    @restaurant = Restaurant.new # Needed to instantiate the form_with
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save # Will raise ActiveModel::ForbiddenAttributesError
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  #   # @restaurant = Restaurant.find(params[:id])
  # end

  # def update
  #   # @restaurant = Restaurant.find(params[:id])
  #   @restaurant.update(restaurant_params) # Will raise ActiveModel::ForbiddenAttributesError
  #   redirect_to restaurant_path(@restaurant)
  # end

  # def destroy
  #   # @restaurant = Restaurant.find(params[:id])
  #   @restaurant.destroy
  #   # No need for app/views/restaurants/destroy.html.erb
  #   redirect_to restaurants_path, status: :see_other
  # end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
