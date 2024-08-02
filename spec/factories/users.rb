FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.phone_number_with_country_code }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }

    trait :client do
      role { :client }
    end

    trait :therapist do
      role { :therapist }
    end

    trait :admin do
      role { :admin }
    end

    # factory :client, traits: [:client]
    factory :therapist_user, traits: [:therapist]
    factory :admin, traits: [:admin]
  end
end
