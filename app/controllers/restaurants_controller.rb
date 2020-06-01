class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @markers = [{ lat: @restaurant.latitude,
                lng: @restaurant.longitude
              }]
    authorize @restaurant
  end

  def new
    @restaurant = Restaurant.new
    @restaurant.menus.build
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      redirect_to edit_menus_restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.open = !@restaurant.open
    authorize @restaurant
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  def edit_menus
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
    @menus = @restaurant.menus
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:description, :photo, :name, :address, :coords, :phone_number, :cuisine, :menu_photo)
  end

end
