require 'open-uri'

class ImageReader
  def self.transcribe(key, coord, username)
    if coord.empty?
      url = 'https://res.cloudinary.com/' + username + '/image/upload/' + key
    else
      url = 'https://res.cloudinary.com/' + username + '/image/upload/' + coord + ',c_crop/' + key
    end

    image = open(url)

    response = GoogleOCR.text_detection(
      image: image,
      max_results: 1
    )
    data = response.responses[0].text_annotations[0].description

    text = data.delete("$").gsub(/(\R+|\.{2,})/,' ').gsub(/\s+/,' ').gsub(/(?<=\d)\.($|\s)/, ' ').gsub(/\s\./, ' ')
    puts "Stripped text"

    # pattern = /(?<dish>.*?)\s(?<price>\d+(\.\d+)?)(\s|$)/
    pattern = /(?<dish>[a-zA-Z].*?)\s(?<price>\d+(\.\d+)?)(\s|$)/
    scanned = text.scan(pattern)
    puts "Scanned text"
    scanned
  end
end
