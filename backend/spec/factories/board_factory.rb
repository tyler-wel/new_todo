FactoryBot.define do
  factory :board do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence(10)}
  end
end