class DashboardController < ApplicationController
  def index
    @restaurants = policy_scope(current_user.restaurants)
    @menu = policy_scope(current_user.menu)
  end
end
