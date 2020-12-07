class System < ApplicationRecord
  has_many :planets
  belongs_to :user
  attribute :name, default: -> do
    letters = ("A".."Z").to_a.sample(3).join
    numbers = (0..9).to_a.sample(4).join
    letters + "-" + numbers
  end

  attribute :image, default: 'http://placekitten.com/500/500'


  # after_initialize :init
  # def init
  #   letters = ("A".."Z").to_a.sample(3).join
  #   numbers = (0..9).to_a.sample(4).join
  #   self.name = letters + "-" + numbers
  # end
end
