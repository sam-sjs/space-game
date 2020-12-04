class User < ApplicationRecord
  has_many :ships
  has_many :systems
  has_many :planets, through: :systems
end
