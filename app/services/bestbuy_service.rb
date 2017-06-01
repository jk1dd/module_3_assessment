class BestbuyService
  def initialize(zip)
    @zip = zip
    @key = ENV['key']
    # @_conn = Faraday.new('http://api.bestbuy.com/v1/stores')
  end

  def find_stores
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?apiKey=#{ENV['key']}&show=longName,city,distance,phone,storeType&format=json")
    stores = JSON.parse(response.body, symbolize_names: true)[:stores]
  end

  def find_total
    response = Faraday.get("https://api.bestbuy.com/v1/stores(area(#{zip},25))?apiKey=#{ENV['key']}&show=longName,city,distance,phone,storeType&format=json")
    total = JSON.parse(response.body, symbolize_names: true)[:total]
  end

  private
  attr_reader :zip, :key

  def conn
    @_conn
  end
end
