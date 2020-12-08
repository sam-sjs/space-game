class Planet < ApplicationRecord
  belongs_to :system

  attribute :size, default: -> do
    @size = rand(1..3)
  end

  attribute :fuel_present, default: -> do
    chance = rand(100)
    chance <= 15 ? true : false
  end

  attribute :fuel_constructed, default: false

  attribute :image, default: -> do
    case @size
    when 1 then "#{rand(1..11)}-125.png"
    when 2 then "#{rand(1..11)}-185.png"
    when 3 then "#{rand(1..11)}-250.png"
    end
  end

  def self.planet_setup(sys_id, sys_name)
    if System.find(sys_id).planets.present? == false
      orbitals = rand(1..4)  #Change to rand(1..4)
      orbitals.times do |i|
        Planet.create name: sys_name + "-" + ('a'..'d').to_a[i], system_id: sys_id
      end
    end
  end

  def fuel_status
    if fuel_present && fuel_constructed
      'Fuel is being mined...'
    elsif fuel_present
      'Fuel Available'
    end
  end
end
