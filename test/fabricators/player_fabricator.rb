Fabricator( :player ) do
  
  name { Faker::Name.name }
  email { Faker::Internet.email }
  password { Devise.friendly_token[0,20] }
end