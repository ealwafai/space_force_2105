class Spacecraft

  attr_reader :name, :fuel

  def initialize(spacecraft_info)
    @name = spacecraft_info[:name]
    @fuel = spacecraft_info[:fuel]
  end
end
