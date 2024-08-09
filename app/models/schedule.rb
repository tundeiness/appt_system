class Schedule < ApplicationRecord
  belongs_to :therapist, class_name: 'User'

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validate :therapist_or_admin

  scope :available, -> { where('end_time > ?', Time.current) }

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    errors.add(:end_time, 'must be after start time') if end_time <= start_time
  end

  def therapist_or_admin
    return if therapist&.therapist? || therapist&.admin?

    errors.add(:therapist, 'must have therapist or admin role')
  end
end
