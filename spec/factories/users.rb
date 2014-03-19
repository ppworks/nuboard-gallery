FactoryGirl.define do
  sequence :email do |n|
    "example#{n.to_s}@example.com"
  end
  factory :user, class: 'User' do
    email
    name { Faker::Name.name }
    image { Faker::Internet.url }
    default_provider_id 1
    confirm_limit_at { Date.current + 10.day }
    hash_to_confirm_email ''
    locale 'ja'
    content { Faker::Lorem.paragraph }
  end
end
