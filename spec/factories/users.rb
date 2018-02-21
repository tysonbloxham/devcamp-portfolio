FactoryBot.define do
  factory :user do
    email Faker::Internet.email
    name Faker::StarWars.character
    password "asdfasdf"
    password_confirmation "asdfasdf"
  end
end
