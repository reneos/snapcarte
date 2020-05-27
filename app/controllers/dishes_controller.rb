class DishesController < ApplicationController
  def update
    @dish = Dish.find(params[:id])
    @dish.update(dish_params)
    menu = Menu.find(params[:menu_id])
    restaurant = menu.restaurant
    authorize @dish
    if @dish.save
      redirect_to edit_restaurant_menu_path(restaurant, menu)
    else
      render 'menus/edit'
    end
  end

  private
  def dish_params
    params.require(:dish).permit(:name, :price)
  end

end
