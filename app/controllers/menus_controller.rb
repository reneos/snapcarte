class MenusController < ApplicationController
  def edit
    @menu = Menu.find(params[:id])
    authorize @menu
  end

  def show
    @menu = Menu.find(params[:id])
    authorize @menu
  end
end
