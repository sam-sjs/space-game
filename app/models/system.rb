class System < ApplicationRecord
  has_many :planets, -> {order(:created_at)}
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

  # Check if a system has already been visited and return the system if it has
  def self.check_system(prev_loc, sys_id)
    system = System.find sys_id
    if prev_loc == "sys_below_id" && system.sys_above_id.present?
      System.find system.sys_above_id
    elsif prev_loc == "sys_above_id" && system.sys_below_id.present?
      System.find system.sys_below_id
    elsif prev_loc == "sys_left_id" && system.sys_right_id.present?
      System.find system.sys_right_id
    elsif prev_loc == "sys_right_id" && system.sys_left_id.present?
      System.find system.sys_left_id
    end
  end
end
