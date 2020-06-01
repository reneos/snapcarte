class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.dish = Dish.find(params[:dish_id])
    @order.cart = Cart.find(params[:cart_id])
    @authorize order
    @order.save
    redirect_to restaurant_path(@order.cart.restaurant)
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to restaurant_path(@order.cart.restaurant)
  end
end
