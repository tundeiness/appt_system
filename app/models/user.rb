class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :role, presence: true

  has_one :client
  has_one :therapist
  has_one :admin

  # enum role: { client: 0, therapist: 1, admin: 2 }
end
