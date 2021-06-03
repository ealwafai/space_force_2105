class Flotilla

  attr_reader :designation

  def initialize(info)
    @designation = info[:designation]
  end
end
