class Planet < ApplicationRecord
  belongs_to :system

  # attribute :name, default: -> do
  #
  # end

  # attribute :name, default: -> do
  #   ('a'..'z').to_a.sample(7).join
  # end

  attribute :size, default: -> do
    rand(1..3)
  end

  attribute :fuel_present, default: -> do
    chance = rand(100)
    chance <= 15 ? true : false
  end

  attribute :fuel_constructed, default: false

  attribute :image, default: 'http://placekitten.com/200/200'

  # attribute :system_id, default: ->  do
  #   System.last.id
  # end

  def fuel_status
    if fuel_present && fuel_constructed
      'Fuel is being mined...'
    elsif fuel_present
      'Fuel Available'
    end
  end

  # def gen_name num
  #   letters = ('a'..'z').to_a
  #   System.last.name + letters[num]
  # end
end
