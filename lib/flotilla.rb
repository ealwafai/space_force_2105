class Flotilla

  attr_reader :name, :personnel, :ships

  def initialize(info)
    @name = info[:designation]
    @personnel = []
    @ships = []
  end

  def add_ship(ship)
    ships.push(ship)
  end

  def add_personnel(person)
    personnel.push(person)
  end

  def recommend_personnel(ship)
    ships.map do |ship|
      ship.requirements
    end
    require "pry"; binding.pry
  end
end
