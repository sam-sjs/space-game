class Planet < ApplicationRecord
  belongs_to :system

  def fuel_status
    if fuel_present && fuel_constructed
      'Fuel is being mined...'
    elsif fuel_present
      'Fuel Available'
    end
  end

  def gen_name num
    letters = ('a'..'z').to_a
    System.last.name + letters[num]
  end
end
