FactoryGirl.define do
  factory :post, class: 'Post' do
    title { Faker::Name.title }
  end
end
