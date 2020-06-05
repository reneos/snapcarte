class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :partners ]

  def home
    @restaurants = Restaurant.all.order(open: :desc)
  end

  def partners
  end
end
