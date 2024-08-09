class Appointment < ApplicationRecord
  belongs_to :therapist, class_name: 'User'
  belongs_to :client, class_name: 'User', optional: true

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_after_start_time
  validate :must_be_therapist_or_admin
  validate :check_client
  validate :within_schedule

  scope :available, -> { where(client_id: nil) }
  scope :booked, -> { where.not(client_id: nil) }

  def bookings(client)
    upddate(client:)
  end

  private

  def end_time_after_start_time
    return if end_time.blank? || start_time.blank?

    errors.add(:end_time, 'must be after start time') if end_time <= start_time
  end

  def must_be_therapist_or_admin
    return if therapist&.therapist? || therapist&.admin?

    errors.add(:therapist, 'must have therapist or admin role')
  end

  def check_client
    errors.add(:client, 'must have client role') if client.present? && !client.client?
  end

  def within_schedule
    return if therapist.nil? || start_time.nil? || end_time.nil?

    schedule = therapist.schedule.find_by('start_time <= ? AND end_time >= ?', start_time, end_time)
    errors.add(:base, 'Appointment must be within therapist schedule') if schedule.nil?
  end
end
