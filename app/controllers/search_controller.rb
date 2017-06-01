class SearchController < ApplicationController
  def show
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(80202,25))?apiKey=#{ENV['key']}&show=longName,city,distance,phone,storeType&format=json")
    things = JSON.parse(response.body)
    # binding.pry
    @stores = Store.find_all(params[:zip])
  end
end
