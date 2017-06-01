class Store
  def initialize(attrs)
    @attrs = {}
  end

  def self.find_all(zip)
    BestbuyService.new(zip).find_stores.map do |store|
      new(store)
    end
  end
end
