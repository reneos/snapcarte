class CartsController < ApplicationController
  def add_to
    @restaurant = Restaurant.find(params[:restaurant_id])
    @cart = Cart.find(params[:id])
    @dish = Dish.find(params[:dish_id])
    authorize @cart
    @cart.add(@dish)
    redirect_to restaurant_path(@restaurant)
  end

  def update
    cart = Cart.find(params[:id])
    status = params[:status]
    cart.confirmed = status
    cart.save
    redirect_to restaurant_path(cart.restaurant)
  end

end
