class Store
  def initialize(attrs={})
    @attrs = attrs
  end

  def self.find_all(zip)
    BestbuyService.new(zip).find_stores.map do |store|
      new(store)
    end
  end

  def self.total(zip)
    BestbuyService.new(zip).find_total
  end

  def long_name
    attrs[:longName]
  end

  def city
    attrs[:city]
  end

  def distance
    attrs[:distance]
  end

  def phone
    attrs[:phone]
  end

  def store_type
    attrs[:storeType]
  end

  private
  attr_reader :attrs

end
