class Appointment < ApplicationRecord
  belongs_to :therapist, class_name: 'User'
  belongs_to :client, class_name: 'User', optional: true

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    errors.add(:end_time, 'must be after start time') if end_time <= start_time
  end
end
