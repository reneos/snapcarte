class RestaurantsController < ApplicationController
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
      redirect_to edit_restaurant_menu_path(@restaurant, @restaurant.menus.first)
    else
      render :new
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :cuisine, menus_attributes: [:currency, :photos])
  end
end
