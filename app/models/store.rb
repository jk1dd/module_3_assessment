class Store
  def initialize(attrs={})
    @attrs = attrs
  end

  def self.find_all(zip)
    la = BestbuyService.new(zip).find_stores.map do |store|
      new(store)
    end
    binding.pry
  end

  def long_name
    attrs[:longName]
    # binding.pry
  end

  def total

  end
end
