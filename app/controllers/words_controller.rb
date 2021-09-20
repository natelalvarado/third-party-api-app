class WordsController < ApplicationController
  def index
    require 'uri'
    require 'net/http'
    require 'openssl'

    url = URI("https://wordsapiv1.p.rapidapi.com/words/#{params[:word]}/definitions")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["x-rapidapi-host"] = 'wordsapiv1.p.rapidapi.com'
    request["x-rapidapi-key"] = 'YOUR-API-KEY-HERE'

    response = http.request(request)
    render json: response.read_body
  end
end
end
