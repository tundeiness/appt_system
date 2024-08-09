class Schedule < ApplicationRecord
  belongs_to :therapist, class_name: 'User'
end
