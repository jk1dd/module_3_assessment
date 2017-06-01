require 'rails_helper'

describe 'Item API' do
  it "gets a list of items" do
# When I send a GET request to /api/v1/items I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
  created_items = create_list(:item, 20)

  get '/api/v1/items'

  expect(response).to be_success
  items = JSON.parse(response.body)
# binding.pry
  expect(items.count).to eq(20)
  expect(items.first["name"]).to eq(created_items.first.name)
  expect(items.first["created_at"]).to eq(nil)
  end
end
