class BestbuyService
  def initialize(zip)
    @zip = zip
    @key = ENV['key']
    @_conn = Faraday.new('http://api.bestbuy.com/v1/stores')
  end

  def find_stores
    response = conn.get("(area(#{zip},25))?apiKey=#{ENV['key']}&show=longName,city,distance,phone,storeType&format=json")
    blah = JSON.parse(response.body)
    binding.pry
  end

  private
  attr_reader :zip, :key

  def conn
    @_conn
  end
end
