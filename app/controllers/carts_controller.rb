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
    authorize cart
    if params[:status]
      status = params[:status]
      cart.confirmed = status
      cart.save
      redirect_to restaurant_path(cart.restaurant)
    elsif params[:cart][:pickup_time]
      time = params[:cart][:pickup_time]
      date = DateTime.parse("#{Date.today.to_s} #{time}")
      cart.pickup_time = date
      cart.confirmed = 2
      cart.save
      raise
      redirect_to dashboard_index_path
    end
  end

end
