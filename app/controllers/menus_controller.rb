class MenusController < ApplicationController
  def edit
    @menu = Menu.find(params[:id])
    authorize @menu
  end

  def update
    @menu = Menu.find(params[:id])
    authorize @menu
    if @menu.update(menu_params)
      redirect_to edit_restaurant_menu_path(@menu.restaurant, @menu)
    else
      render :edit
    end
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

  private

  def menu_params
    params.require(:menu).permit(dishes_attributes: [:id, :name, :price])
  end
end
