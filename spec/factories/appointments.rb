FactoryBot.define do
  factory :appointment do
    association :therapist, factory: :user, role: :therapist
    association :client, factory: :user, role: :client, optional: true
    start_time { Faker::Time.forward(days: 5, period: :morning) }
    end_time { start_time + 1.hour }

    trait :booked do
      association :client, factory: :user, role: :client
    end

    trait :available do
      client { nil }
    end
  end
end
