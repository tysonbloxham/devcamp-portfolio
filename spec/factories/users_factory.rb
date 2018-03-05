FactoryBot.define do
  factory :user do
    email Faker::Internet.email
    name Faker::StarWars.character
    password "asdfasdf"
    password_confirmation "asdfasdf"
    roles "user"
  end

  factory :admin, parent: :user do
     roles "site_admin"
  end
end
