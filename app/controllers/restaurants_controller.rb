class RestaurantsController < ApplicationController
  def show
    @restaurant = Resturant.find(params[:id])
    @menu = Menu.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Resturant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@resturant)
    else
      render :new
  end

  private
    def restaurant_params
      params.require(:restaurant).permit(:address, :name, :phone_number, :cuisine)
    end
end
