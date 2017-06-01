require 'rails_helper'

describe 'Item API' do
  it "gets a list of items" do
    created_items = create_list(:item, 20)

    get '/api/v1/items'

    expect(response).to be_success
    items = JSON.parse(response.body)

    expect(items.count).to eq(20)
    expect(items.first["name"]).to eq(created_items.first.name)
    expect(items.first["created_at"]).to eq(nil)
  end

  it "gets one item by id" do
    created_item = create(:item)

    get "/api/v1/items/#{created_item.id}"

    expect(response).to be_success
    item = JSON.parse(response.body)

    expect(item["id"]).to eq(created_item.id)
    expect(item["name"]).to eq(created_item.name)
    expect(item["description"]).to eq(created_item.description)
    expect(item["image_url"]).to eq(created_item.image_url)
    expect(item["created_at"]).to eq(nil)
    expect(item["updated_at"]).to eq(nil)
  end

  it "deletes an item by id" do
    item1, item2 = create_list(:item, 2)

    expect(Item.count).to eq(2)

    delete "/api/v1/items/#{item1.id}"

    expect(response).to be_success
    expect(Item.count).to eq(1)
  end

  it "creates an item" do
    item_params = {name: "Water", description: "Earth's most precious resource", image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCajC7VN-DohIcJhXYJpqL_rSYPOBwmelEipvw1bBMDaViyiAAocPuPlE"}

    post '/api/v1/items', params: {item: item_params}

    item = Item.last

    expect(response).to be_success
    expect(Item.count).to eq(1)
    expect(item.name).to eq("Water")
    expect(item.description).to eq("Earth's most precious resource")
  end
end
