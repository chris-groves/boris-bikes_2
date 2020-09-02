require 'pry'

class DockingStation
  attr_accessor :docked_bikes

  DEFAULT_CAPACITY = 20

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
    @docked_bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes.empty?
  end
end
