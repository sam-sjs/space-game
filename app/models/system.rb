class System < ApplicationRecord
  has_many :planets
  belongs_to :user
end
