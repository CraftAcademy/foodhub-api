FactoryBot.define do
  factory :rating do
    user
    recipe
    score {rand(1..5)}
  end
end
