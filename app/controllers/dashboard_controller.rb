class DashboardController < ApplicationController
  def index
    @restaurants = policy_scope(current_user.restaurants)
  end
end
