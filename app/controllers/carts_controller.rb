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
      if cart.pending?
        user = cart.restaurant.user
        UserChannel.broadcast_to(user, render_to_string(partial: "shared/notification"))
        redirect_to restaurant_path(cart.restaurant)
      elsif cart.accepted?
        redirect_to dashboard_index_path
      end
    elsif params[:cart][:pickup_time]
      time = params[:cart][:pickup_time]
      date = DateTime.parse("#{Date.today.to_s} #{time}")
      cart.pickup_time = date
      cart.confirmed = 2
      cart.save
      redirect_to dashboard_index_path
    end
  end

end
