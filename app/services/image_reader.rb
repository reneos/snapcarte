require 'open-uri'
require 'net/http'
require 'uri'
require 'json'
require 'base64'


class ImageReader
  def self.transcribe(image_key)
    puts "Getting image url"
   image_url = "https://res.cloudinary.com/dyam1xame/image/upload/e_contrast:100/e_blackwhite/" + image_key
   image = open(image_url).read
   puts "Read the image"
   encoded = Base64.encode64(image)
   puts "Encoded the image"
   uri = URI.parse('https://vision.googleapis.com/v1/images:annotate?key=' + ENV['GOOGLE_API'])
   request = Net::HTTP::Post.new(uri)
   request.content_type = 'application/json'
   request.body = JSON.dump(
     'requests' => [
       {
         'image' => {
           'content' => encoded
         },
         'features' => [
           {
             'type' => 'TEXT_DETECTION',
             'model' => 'builtin/latest'
           }
         ]
       }
     ]
   )

   req_options = {
     use_ssl: uri.scheme == 'https'
   }

   response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
     http.request(request)
   end

   data = JSON.parse(response.body)

   puts "Made the request and received body"

   text = data['responses'][0]['textAnnotations'][0]['description']
   text = text.delete("$").gsub(/(\R+|\.{2,})/,' ').gsub(/\s+/,' ').gsub(/\s\./, ' ')

   puts "Stripped text"

   # pattern = /(?<dish>.*?)\s(?<price>\d+(\.\d+)?)(\s|$)/
   pattern = /(?<dish>[a-zA-Z].*?)\s(?<price>\d+(\.\d+)?)(\s|$)/
   scanned = text.scan(pattern)
   puts "Scanned text"
   scanned
  end
end

