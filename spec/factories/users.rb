FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    phone_number { Faker::PhoneNumber.phone_number_with_country_code }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    role { :client }
    specialization { nil }

    trait :client do
      role { :client }
    end

    trait :therapist do
      role { :therapist }
      specialization { 'Psychiatry' }
    end

    trait :admin do
      role { :admin }
      specialization { 'Cognitive Behavioral Therapy' }
    end

    factory :therapist_user, traits: [:therapist]
    factory :admin, traits: [:admin]
  end
end
