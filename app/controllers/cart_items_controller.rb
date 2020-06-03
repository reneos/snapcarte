class CartItemsController < ApplicationController
  def destroy
    item = CartItem.find(params[:id])
    authorize item
    item.destroy
    redirect_to restaurant_path(item.cart.restaurant)
  end
end
