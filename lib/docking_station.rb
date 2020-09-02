require 'pry'

class DockingStation
  attr_accessor :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise 'Dockingstation is empty' if empty?
    @docked_bikes.pop
  end

  def dock(bike)
    raise 'Dockingstation is full' if full?
    @docked_bikes << bike
  end

  private

  def full?
    @docked_bikes.length > 0
  end

  def empty?
    @docked_bikes.length < 1
  end
end
