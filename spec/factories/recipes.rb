FactoryBot.define do
  factory :recipe do
    title { "MyString" }
    ingredients { "MyText" }
    directions { "MyText" }
    user
    after(:build) do |recipe|
      recipe.image.attach(io: File.open(Rails.root.join('spec', 'fixtures', 'pizza.jpeg')), filename: "pizza.jpeg", content_type: 'image/jpg')
    end
  end
end