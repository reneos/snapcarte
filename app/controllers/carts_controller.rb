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
      cart.request_type = params[:request_type] if params[:request_type]
      cart.save
      if cart.pending?
        user = cart.restaurant.user
        UserChannel.broadcast_to(user, render_to_string(partial: "shared/notification"))
        redirect_to restaurant_path(cart.restaurant), notice: "Order submitted to restaurant! Please wait for confirmation."
      elsif cart.accepted? && cart.request_type == 0
        redirect_to dashboard_index_path
      elsif cart.accepted? && cart.request_type == 1
        DeliveryRequester.call(cart)
        redirect_to dashboard_index_path
      elsif cart.completed?
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
