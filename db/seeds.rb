require 'faker'

15.times do 
  User.create!(
    name: Faker::Name.name,
    service_era: Faker::Space.planet,
    status: Faker::StarWars.specie,
    )
end

5.times do
  Organization.create!(
    name: Faker::StarWars.specie,
    description: Faker::Hipster.paragraph,
    era_served: Faker::Space.planet,
    category: Faker::LordOfTheRings.character,
    avg_rating: Faker::Number.decimal(1,1),
    url: Faker::Internet.domain_name,
    address1: Faker::Address.street_address,
    address2: Faker::Address.secondary_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zipcode: Faker::Address.zip,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.email,
    creator_id: rand(1..15)
  )
end

5.times do
  Review.create!(
    rating: Faker::Number.between(1, 10),
    feedback: Faker::Hipster.paragraph,
    recommend: Faker::Boolean.boolean, #=> true
    organization_id: rand(1..15),
    user_id: rand(1..15)
    )
end
