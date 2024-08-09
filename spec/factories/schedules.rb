FactoryBot.define do
  factory :schedule do
    association :therapist, factory: :user, role: :therapist
    start_time { DateTime.now }
    end_time { DateTime.now + 1.hour }

    # trait :with_invalid_end_time do
    #   end_time { start_time - 1.hour }
    # end
  end
end
