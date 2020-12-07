class System < ApplicationRecord
  has_many :planets
  belongs_to :user

  def gen_name
    letters = ("A".."Z").to_a.sample(3).join
    numbers = (0..9).to_a.sample(4).join
    letters + "-" + numbers
  end
end
