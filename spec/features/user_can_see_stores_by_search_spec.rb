require 'rails_helper'

RSpec.feature 'User can search for stores' do
  context 'when she enters a zip in a search box' do
    scenario 'she can see stores within 25 miles' do
      VCR.use_cassette('store_search') do
        visit '/'

        fill_in 'zip', with: "80202"
        click_on("search")

        expect(current_path).to eq(search_path)
        expect(page).to have_content("16 Total Stores")
        expect(page).to have_selector(".store", count: 10)

        within first(".store") do
          expect(page).to have_content("Name: BEST BUY MOBILE - CHERRY CREEK SHOPPING CENTER")
          expect(page).to have_content("City: DENVER")
          expect(page).to have_content("Distance: 3.45")
          expect(page).to have_content("Phone Number: 303-270-9189 ")
          expect(page).to have_content("Store Type: Mobile SAS")
        end
      end
    end
  end
end
