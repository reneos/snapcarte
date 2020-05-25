class MenusController < ApplicationController
   before_action :set_menu, only: [:show, :edit, :update]
  def show

  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to menu_path(@menu)
    else
      render :new
    end
  end

  def edit

  end

  def update
    @menu.update(menu_params)
    redirect_to menu_path(@menu)
  end

  private

  def set_menu
    @menu = Menu.find(params[:id])
  end

  def menu_params
    params.require(:menu).permit(:currency)
end
