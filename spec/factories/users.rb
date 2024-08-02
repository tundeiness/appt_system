FactoryBot.define do
  factory :user do
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
    # factory :therapist, traits: [:therapist]
    # factory :admin, traits: [:admin]
  end
end
