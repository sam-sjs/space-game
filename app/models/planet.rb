class Planet < ApplicationRecord
  belongs_to :system

  attribute :size, default: -> do
    @size = rand(1..3)
  end

  attribute :fuel_present, default: -> do
    chance = rand(100)
    chance < 15 ? true : false
  end

  attribute :fuel_constructed, default: false

  attribute :sensors_detected, default: -> do
    chance = rand(100)
    chance < 15 ? true : false
  end

  attribute :sensors_investigated, default: false

  attribute :image, default: -> do
    case @size
    when 1 then "#{rand(1..11)}-125.png"
    when 2 then "#{rand(1..11)}-185.png"
    when 3 then "#{rand(1..11)}-250.png"
    end
  end

  def self.planet_setup(sys_id, sys_name)
    if System.find(sys_id).planets.present? == false
      chance = rand(1..100)
      orbitals = case
      when chance < 16 then 1
      when chance >= 16 && chance < 51 then 2
      when chance >= 51 && chance < 86 then 3
      when chance >= 86 then 4
      end
      orbitals.times do |i|
        Planet.create name: sys_name + "-" + ('a'..'d').to_a[i], system_id: sys_id
      end
    end
  end

  def fuel_status
    if fuel_present && fuel_constructed
      'Helium-3 is being mined...'
    elsif fuel_present
      'Helium-3 Available'
    else
      'No Helium-3 deposits found'
    end
  end

  def sensor_status
    if sensors_detected && sensors_investigated
      'Point of interest investigated'
    elsif sensors_detected
      'Point of interst found'
    else
      'Nothing of note'
    end
  end

end
