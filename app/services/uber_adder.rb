require "uri"
require "net/http"

class UberAdder

  def self.call(restaurant)


    url = URI("https://api.uber.com/v2/eats/stores/#{ENV['STORE_ID']}/menus")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true


    dishes =  restaurant.dishes
    dishes.each do |dish|
      dish_str = <<-DISH

      DISH
    end

    request = Net::HTTP::Put.new(url)
    request["Authorization"] = "Bearer #{ENV['UBER_TOKEN']}"
    request["Content-Type"] = ["application/json", "text/plain"]
    request.body = ""
    response = https.request(request)
    puts response.read_body
  end

end
