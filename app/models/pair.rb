class Pair < ApplicationRecord
  belongs_to :client, class_name: 'User'
  belongs_to :therapist, class_name: 'User'

  validates :client, presence: true
  validates :therapist, presence: true
  validates :client_id, uniqueness: { scope: :therapist_id, message: 'pair already exists' }
end
