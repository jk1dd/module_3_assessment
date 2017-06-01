FactoryGirl.define do
  factory :item do
    name 'item'
    description 'great item'
    image_url 'google.com'
    created_at Time.now
    updated_at Time.now
  end
end
