Fabricator(:contact) do
  first { Faker::Name.first_name }
  last { Faker::Name.last_name }
  address { Faker::Address.street_address }
  city {Faker::Address.city}
  state { Faker::Address.state_abbr }
  zip { Faker::Address.zip }
  country "USA"
  phone { Faker::PhoneNumber.phone_number }
  #notes { Faker::Lorem.paragraph }
end