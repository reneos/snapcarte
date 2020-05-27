class MenusController < ApplicationController
  def edit
    @menu = Menu.find(params[:id])
    @restaurant = @menu.restaurant
    authorize @menu
  end

  def show
    @menu = Menu.find(params[:id])
    authorize @menu
  end

  def export
    @menu = Menu.find(params[:id])
    authorize @menu
    # exported == true
  end
end
