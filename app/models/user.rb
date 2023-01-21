class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :journals, dependent: :destroy
  has_many :voice, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
