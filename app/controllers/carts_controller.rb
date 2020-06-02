class CartsController < ApplicationController
  def add_to
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cart = Cart.find(params[:id])
    @dish = Dish.find(params[:dish_id])
    authorize @cart
    @cart.add(@dish)
    redirect_to restaurant_path(@restaurant)
  end

end
