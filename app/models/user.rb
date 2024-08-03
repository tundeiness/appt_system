class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[client therapist admin]

  scope :therapists, -> { where(role: :therapist) }
  scope :clients, -> { where(role: :client) }

  validates :role, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone_number, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :specialization, presence: true, if: -> { therapist? || admin? }

  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :client
  end
end
