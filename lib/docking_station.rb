require 'pry'

class DockingStation
  attr_accessor :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise 'Dockingstation is empty' if @docked_bikes.empty?
    @docked_bikes.pop
  end

  def dock(bike)
    @docked_bikes << bike
  end
end
