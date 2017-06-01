# As a user
# When I visit "/"
# And I fill in a search box with "80202" and click "search"
# Then my current path should be "/search" (ignoring params)
# And I should see stores within 25 miles of 80202
# And I should see a message that says "16 Total Stores"
# And I should see exactly 10 results
# And I should see the long name, city, distance, phone number and store type for each of the 10 results

require 'rails_helper'

RSpec.feature 'User can search for stores' do
  context 'when she enters a zip in a search box' do
    scenario 'she can see stores within 25 miles' do
      VCR.use_cassette('store_search') do
        visit '/'
# save_and_open_page
        fill_in 'zip', with: "80202"
        click_on("search")

        expect(current_path).to eq(search_path)
        expect(page).to have_content("16 Total Stores")
        expect(page).to have_selector(".store", count: 10)
        within (".store") do
          expect(page).to have_content("Name: ")
          expect(page).to have_content("Distance: ")
          expect(page).to have_content("Phone Number: ")
          expect(page).to have_content("Store Type: ")
        end
      end
    end
  end
end
