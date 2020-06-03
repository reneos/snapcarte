require "uri"
require "net/http"

class QuoteGetter

  def self.call(cart)
    user_address = cart.user.address
    restaurant_address = cart.restaurant.address
    parameters = [['dropoff_address',user_address], ['pickup_address', restaurant_address]]

    url = URI("https://api.postmates.com/v1/customers/cus_MgswAofl-gOmDF/delivery_quotes")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Basic MDFmMDFkYWMtMmMwZS00MmRhLTllOGMtZDQ5OTRjODJjODZmOg=="
    request["Content-Type"] = "application/x-www-form-urlencoded"
    request["Cookie"] = "__cfduid=da3ac727b81e11143da2dd32dd009ac661591157779"
    request.body = URI.encode_www_form(parameters)
    response = https.request(request)
    JSON.parse(response.body)
  end

end

