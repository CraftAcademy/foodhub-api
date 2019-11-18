FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "MyString" }
    name { Faker::Internet.username }
  end
end
