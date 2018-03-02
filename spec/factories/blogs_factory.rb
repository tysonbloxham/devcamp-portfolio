FactoryBot.define do
  factory :blog do
    title Faker::StarWars.character
    body Faker::StarWars.quote
  end
end
