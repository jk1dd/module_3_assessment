require 'rails_helper'

describe 'Store' do
  it 'returns an array of stores objects' do
    VCR.use_cassette('returns_stores') do
      zip = '80202'
      stores = Store.find_all(zip)

      expect(stores).to be_an(Array)
      expect(stores.count).to eq(10)
      expect(stores.first).to be_a(Store)
    end
  end

  it "returns true total of stores" do
    VCR.use_cassette('returns_total') do
      zip = '80202'
      total = Store.total(zip)

      expect(total).to eq(16)
      expect(total).to be_a(Integer)
    end
  end
end
