

class ImageReader
  def self.transcribe(url)
    response = GoogleOCR.text_detection(
      image: url,
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
