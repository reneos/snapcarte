class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(cart_params)
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def update
    @cart = Cart.find(params[:id])
    if cart.update(cart_params)
      redirect_to edit_restaurant_cart_path(@restaurant.cart, @cart)
    else
      render :edit
    end
  end

  private

  def cart_params
    params.require(:cart).permit(:total)
  end

end
