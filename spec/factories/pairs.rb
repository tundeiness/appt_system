FactoryBot.define do
  factory :pair do
    association :client, factory: :user, role: :client
    association :therapist, factory: :user, role: :therapist
  end
end
