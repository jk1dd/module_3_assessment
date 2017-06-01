require 'rails_helper'

describe BestbuyService do
  context '#find_stores' do
    it 'finds stores' do
      VCR.use_cassette('finds_stores_call') do
        zip = '80202'

        stores = BestbuyService.new(zip).find_stores
        expect(stores.first).to have_key(:longName)
        expect(stores.first).to have_key(:city)
        expect(stores.first).to have_key(:distance)
        expect(stores.first).to have_key(:phone)
        expect(stores.first).to have_key(:storeType)
      end
    end
  end

  context '#find_total' do
    it 'finds the total' do
      VCR.use_cassette('finds_total_call') do
        zip = '80202'

        total = BestbuyService.new(zip).find_total
        expect(total).to eq(16)
        expect(total).to be_a(Integer)
      end
    end
  end
end
