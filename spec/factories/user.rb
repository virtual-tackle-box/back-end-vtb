FactoryBot.define do 
  factory :user do 
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    phone_number { Faker::PhoneNumber.cell_phone }
  end
end