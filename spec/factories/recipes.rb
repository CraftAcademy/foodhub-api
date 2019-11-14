FactoryBot.define do
  factory :recipe do
    title { "MyString" }
    ingredients { "MyText" }
    directions { "MyText" }
    user
  end
end