class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new
    @cart.restaurant = Cart.find(params[:restuaurant_id])
    @cart.user = current.user
    if cart.save
      redirect_to cart_path(@cart)
    else
      render :create
    end
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    if cart.update
      redirect_to edit_restaurant_cart_path(@restaurant.cart, @cart)
    else
      render :edit
    end
  end

end
