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

  def build_mine(user_id)
    user = User.find user_id
    fuel_found = rand(2..4)
    user.fuel += fuel_found
    user.save
    self.fuel_constructed = true
    self.save
    "You have successfully constructed a Mine, check back later to retrieve extracted Helium-3. \n While constructing, your engineers uncovered #{fuel_found} units of Helium-3."
  end

  def investigate_poi(user_id)

  end

  def found_credits(user_id)
    user = User.find user_id
    credits = rand(250..750)
    user.currency += credits
    user.save
    "The away team have returned with a significant cache of precious minerals totalling #{credits}&\#8353; in value."
  end

  def found_fuel(user_id)
    user = User.find user_id
    fuel = rand(1..3)
    user.fuel += fuel
    user.save
    "The sensor ping was caused by multiple small deposits of Helium-3 just benieth the surface.  While not significant enoungh to mine it is easily accessible and the away team collect #{fuel} units before heading back."
  end

  def disaster(user_id)
    user = User.find user_id
    fuel_lost = rand(1..2)

  end

  def found_energy_crystal

  end

end
