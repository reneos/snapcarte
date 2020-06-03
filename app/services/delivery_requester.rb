require "uri"
require "net/http"

class DeliveryRequester

  def self.call(cart)
    restaurant = cart.restaurant
    quote = QuoteGetter.call(cart)
    quote_id = quote['id']
    user = cart.user

    url = URI("https://api.postmates.com/v1/customers/cus_MgswAofl-gOmDF/deliveries")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true

    parameters = [
                  ['dropoff_address',user.address],
                  ['dropoff_name', user.full_name],
                  ['dropoff_phone_number', user.phone_number],
                  ['pickup_address', restaurant.address],
                  ['pickup_name', restaurant.name],
                  ['pickup_phone_number', restaurant.phone_number],
                  ['manifest','Food'],
                  ['quote_id',quote_id]
                ]

    request = Net::HTTP::Post.new(url)
    request["Authorization"] = "Basic MDFmMDFkYWMtMmMwZS00MmRhLTllOGMtZDQ5OTRjODJjODZmOg=="
    request["Content-Type"] = "application/x-www-form-urlencoded"
    request["Cookie"] = "__cfduid=da3ac727b81e11143da2dd32dd009ac661591157779"
    request.body = URI.encode_www_form(parameters)

    response = https.request(request)
    response = JSON.parse(response.body)
    cart.delivery_url = response['tracking_url']
    cart.save
  end

end








