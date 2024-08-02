class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: %i[client therapist admin]

  scope :therapists, -> { where(role: :therapist) }
  scope :clients, -> { where(role: :client) }

  validates :role, presence: true
  after_initialize :set_default_role, if: :new_record?

  private

  def set_default_role
    self.role ||= :client
  end
end
