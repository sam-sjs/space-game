class User < ApplicationRecord
  has_many :ships
  has_many :systems
  has_many :planets, through: :systems
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, length: {minimum: 2}

  attribute :green_crystals, default: 0
  attribute :red_crystals, default: 0
  attribute :blue_crystals, default: 0
  attribute :purple_crystals, default: 0
end
