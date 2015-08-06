# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post_image do
    post_id 1
    image "MyString"
  end
end
