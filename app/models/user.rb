class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :journals, dependent: :destroy
  has_many :voices, dependent: :destroy

  validates :email, presence: true, uniqueness: true

  def generate_jwt
    JWT.encode({ id:, exp: 60.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
  end
end
