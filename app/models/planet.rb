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
      fuel = ((system.time_entered - self.mine_time) / 60).to_i
      true_fuel = fuel > 10 ? 10 : fuel
      "He-3 Mined...#{true_fuel}"
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

  def build_mine
    # Check mine is valid and if so run
    if self.fuel_present && !self.fuel_constructed
      fuel_found = rand(2..4)
      system.user.fuel += fuel_found
      system.user.save
      self.mine_time = Time.now.getutc
      self.fuel_constructed = true
      self.save
      "You have successfully constructed a Mine, check back later to retrieve extracted Helium-3. \n While constructing, your engineers uncovered #{fuel_found} units of Helium-3."
    end
  end

  def collect_fuel
    fuel = ((system.time_entered - self.mine_time) / 60).to_i
    true_fuel = fuel > 10 ? 10 : fuel
    self.mine_time = Time.now.getutc
    self.save
    system.user.fuel += true_fuel
    system.user.save
    "#{true_fuel} units of Helium-3 collected from your mining station"
  end

  def investigate_poi
    # Check POI is valid and if so run
    if self.sensors_detected && !self.sensors_investigated
      chance = rand(1..100)
      self.sensors_investigated = true
      self.save
      case
      when chance >=85 then found_energy_crystal
      when chance < 85 && chance >= 50 then found_credits
      when chance < 50 && chance >= 15 then found_fuel
      when chance < 15 then disaster
      end
    end
  end

  def found_credits
    credits = rand(250..750)
    system.user.currency += credits
    system.user.save
    "The away team have returned with a significant cache of precious minerals totalling #{credits}&\#8353; in value."
  end

  def found_fuel
    fuel = rand(1..3)
    system.user.fuel += fuel
    system.user.save
    "The sensor ping was caused by multiple small deposits of Helium-3 just benieth the surface.  While not significant enoungh to mine it is easily accessible and the away team collect #{fuel} units before heading back."
  end

  def disaster
    fuel_lost = rand(1..2)
    system.user.fuel -= fuel_lost
    system.user.save
    "DISASTER! While exploring the planet your away team inadvertently woke up an ancient defence system.  You hold under rail gun fire to collect your team before making a hasty escape.  Unfortunately your fuel tanks were breached in the barrage and #{fuel_lost} units of Helium-3 were lost to space before repairs could be made."
  end

  #Ugly method - trying to be too clever, there must be a cleaner way - tidy up later - there's a loop in here somewhere...
  def found_energy_crystal
    chance = rand(1..100)
    missing_crystals = ['green', 'red', 'blue', 'purple']
    found_crystals = []
    choose_crystal = ''
    if !system.user.green_crystals.nil?
      missing_crystals.delete 'green'
      found_crystals << 'green'
    end
    if !system.user.green_crystals.nil?
      missing_crystals.delete 'red'
      found_crystals << 'red'
    end
    if !system.user.green_crystals.nil?
      missing_crystals.delete 'blue'
      found_crystals << 'blue'
    end
    if !system.user.green_crystals.nil?
      missing_crystals.delete 'purple'
      found_crystals << 'purple'
    end
    if chance < 26 && found_crystals.length > 0 || found_crystals.length == 4
      choose_crystal = found_crystals.sample
    else
      choose_crystal = missing_crystals.sample
    end
    case choose_crystal
    when 'green' then green_crystal
    when 'red' then red_crystal
    when 'blue' then blue_crystal
    when 'purple' then purple_crystal
    end
  end

  def green_crystal
    system.user.green_crystals = system.user.green_crystals.to_i + 1
    system.user.save
    "The away team have had tremendous success!  Uncovering a GREEN energy crystal from the surface of the planet.  You are one step closer to saving your homeworld!"
  end

  def red_crystal
    system.user.red_crystals = system.user.red_crystals.to_i + 1
    system.user.save
    "The away team have had tremendous success!  Uncovering a RED energy crystal from the surface of the planet.  You are one step closer to saving your homeworld!"
  end

  def blue_crystal
    system.user.blue_crystals = system.user.blue_crystals.to_i + 1
    system.user.save
    "The away team have had tremendous success!  Uncovering a BLUE energy crystal from the surface of the planet.  You are one step closer to saving your homeworld!"
  end

  def purple_crystal
    system.user.purple_crystals = system.user.purple_crystals.to_i + 1
    system.user.save
    "The away team have had tremendous success!  Uncovering a PURPLE energy crystal from the surface of the planet.  You are one step closer to saving your homeworld!"
  end

end
