class DashboardController < ApplicationController
  before_action :get_restaurants
  skip_after_action :verify_authorized

  def index
    # @restaurants = policy_scope(current_user.restaurants)
    redirect_to pickup_orders_dashboard_index_path
  end

  def pickup_orders

  end

  def delivery_orders
  end

  def past_orders
  end

  def restaurants
  end

  private
  def get_restaurants
    @restaurants = policy_scope(current_user.restaurants)
  end
end
