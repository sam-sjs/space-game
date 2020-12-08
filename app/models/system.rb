class System < ApplicationRecord
  has_many :planets
  belongs_to :user
  belongs_to :sys_below, class_name: 'System', optional: true
  belongs_to :sys_above, class_name: 'System', optional: true
  belongs_to :sys_left, class_name: 'System', optional: true
  belongs_to :sys_right, class_name: 'System', optional: true

  attribute :name, default: -> do
    letters = ("A".."Z").to_a.sample(3).join
    numbers = (0..9).to_a.sample(4).join
    letters + "-" + numbers
  end

  attribute :image, default: 'http://placekitten.com/500/500'
end
