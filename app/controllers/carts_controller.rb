class CartsController < ApplicationController
  def add
    @cart = Cart.create
    @dish = Dish.find(params[:dish_id])
    @cart.add(@dish, @dish.price)
  end

  def remove
    @cart.remove(@product, 1)
  end

  def empty
    @cart.clear
  end

  def total
    @cart.total
  end

  def create
    @cart = Cart.new
    @cart.restaurant = Cart.find(params[:restuaurant_id])
    @cart.user = current.user
    authorize @cart
    if @cart.save
      redirect_to cart_path(@cart)
    else
      render :create
    end
  end

  def edit
    @cart = Cart.find(params[:id])
    authorize @cart
  end

  def update
    @cart = Cart.find(params[:id])
    authorize @cart
    if cart.update
      redirect_to edit_restaurant_cart_path(@restaurant.cart, @cart)
    else
      render :edit
    end
  end

end
