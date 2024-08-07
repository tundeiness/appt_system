class Appointment < ApplicationRecord
  belongs_to :therapist, class_name: 'User'
  belongs_to :client, class_name: 'User', optional: true

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validate :therapist_must_be_therapist_or_admin
  validate :check_client

  scope :available, -> { where(client_id: nil) }
  scope :booked, -> { where.not(client_id: nil) }

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    errors.add(:end_time, 'must be after start time') if end_time <= start_time
  end

  def therapist_must_be_therapist_or_admin
    return if therapist&.therapist? || therapist&.admin?

    errors.add(:therapist, 'must have therapist or admin role')
  end

  def check_client
    errors.add(:client, 'must have client role') if client.present? && !client.client?
  end
end
