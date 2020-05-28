class DishesController < ApplicationController
  def update
    @dish = Dish.find(params[:id])
    @menu = Menu.find(params[:menu_id])
    @dish.update(dish_params)
    restaurant = @menu.restaurant
    authorize @dish
    if @dish.save
      redirect_to edit_restaurant_menu_path(restaurant, @menu)
    else
      render 'menus/edit'
    end
  end

  def destroy
    @dish = Dish.find(params[:id])
    authorize @dish
    @dish.destroy
    redirect_back(fallback_location: root_path)
  end

  private
  def dish_params
    params.require(:dish).permit(:name, :price)
  end

end
