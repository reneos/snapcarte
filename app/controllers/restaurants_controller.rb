class RestaurantsController < ApplicationController
  def show
    @restaurant = Restaurant.find(params[:id])
    @markers = [{ lat: @restaurant.latitude,
                lng: @restaurant.longitude
              }]
    authorize @restaurant
  end

  def new

    # check if we have scrape_url
    if params[:scraping] != nil
      url = params[:scraping][:url]
       @restaurant = scrape_restaurant(url)
    else
      @restaurant = Restaurant.new
    end
    @restaurant.menus.build
    authorize @restaurant
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.user = current_user
    authorize @restaurant
    if @restaurant.save
      redirect_to edit_restaurant_menu_path(@restaurant, @restaurant.menus.first), flash: {notice: "Congratulations! Restaurant and menu successfully created." }
    else
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.open = !@restaurant.open
    authorize @restaurant
    @restaurant.save
    redirect_to restaurant_path(@restaurant)
  end

  private
# create new method scrape_restaurant(url)

  def scrape_restaurant(url)
    # require "open-uri"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    Restaurant.new(
      address: html_doc.search('.restaurants-detail-top-info-TopInfo__infoCellLink--2ZRPG')[1].text.strip,
      phone_number: html_doc.search('.restaurants-detail-top-info-TopInfo__infoCellLink--2ZRPG')[2].text.strip,
      cuisine: html_doc.search('.restaurants-detail-overview-cards-DetailsSectionOverviewCard__tagText--1OH6h')[0].text.strip,
      name: html_doc.search('.restaurants-detail-top-info-TopInfo__restaurantName--1IKBe').text.strip
      )

      # html_doc.search('.yF-2QEPN').text.strip
  end

  def restaurant_params
    params.require(:restaurant).permit(:description, :photo, :name, :address, :phone_number, :cuisine, menus_attributes: [:currency, :photos])
  end
end
