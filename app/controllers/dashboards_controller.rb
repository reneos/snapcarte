class DashboardsController < ApplicationController
  def index
    @restaurants = policy_scope(current_user.restaurants)
    @menus = policy_scope(current_user.menus)
  end
end
