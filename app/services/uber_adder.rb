require "uri"
require "net/http"
require "time"
class UberAdder

  def self.call(restaurant)


    url = URI("https://api.uber.com/v2/eats/stores/#{ENV['STORE_ID']}/menus")

    https = Net::HTTP.new(url.host, url.port);
    https.use_ssl = true


    dishes =  restaurant.dishes
    items = []
    dishes.each do |dish|
        items << {
          "title": {
            "translations": {
              "en_us": dish.name
            }
          },
          "image_url": "null",
          "price_info": {
            "price": dish.price_cents
          },
          "id": dish.name
        }
    end

    categories = []
    restaurant.menus.each do |menu|  #iterate
      # for each menu iterate over the dishes
      entities = menu.dishes.map do |dish|
        {
          "type": "ITEM",
          "id": dish.name
        }
      end
      thing = {
        "entities" => entities,
        "id": menu.name,
        "title": {
            "translations": {
                "en_us": menu.name
            }
        }
      }
      categories << thing
    end
    p categories
    display_options =
        {
        "disable_item_instructions": true
        }
    # menus
    weekday = {
      "Sun" => "sunday",
      "Mon" => "monday",
      "Tue" => "tuesday",
      "Wed" => "wednesday",
      "Thu" => "thursday",
      "Fri" => "friday",
      "Sat" => "saturday"
    }
    open_hours = []
    time_table = restaurant.time.scan(/(?<day>[A-Z][a-z]{2})(?<hours>\d.+?(AM|PM).+?(AM|PM))/)
    service_availability = time_table.each do |day|
      day_of_week = weekday[day[0]]
      times = day[1].split(" - ").map do |time|
        Time.parse(time).strftime('%H:%M')
      end
      open_hours << {
        "time_periods": [
            {
              "start_time": times[0],
              "end_time": times[1]
            }
        ],
        "day_of_week": day_of_week
      }
    end
    category_ids = restaurant.menus.map do |menu|
        menu.name
    end
    hours_id = "All-day"
    title = {
            "translations": {
                "en_us": "All day"
            }
          }

    body = {
      "items": items,
      "display_options": display_options,
      "menus": [
          {
              "service_availability": open_hours,
              "category_ids": category_ids,
              "id": hours_id,
              "title": title
          }
      ],
      "categories": categories,
      "modifier_groups": []
    }

    request = Net::HTTP::Put.new(url)
    request["Authorization"] = "Bearer #{ENV['UBER_TOKEN']}"
    request["Content-Type"] = ["application/json", "text/plain"]
    request.body = JSON.pretty_generate(body)
    response = https.request(request)
    puts response.read_body
  end

end
