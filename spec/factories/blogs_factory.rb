FactoryBot.define do
  factory :blog do
    title Faker::StarWars.character
    body Faker::StarWars.quote
  end

  factory :blog_two, class: "Blog" do
    title "This is a title"
    body "This is a body"
  end
end
