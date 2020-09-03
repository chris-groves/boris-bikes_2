require 'pry'

class DockingStation
  attr_accessor :working_docked_bikes, :broken_docked_bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @broken_docked_bikes = []
    @working_docked_bikes = []
  end

  def release_bike
    raise 'Dockingstation is empty' if empty?
    raise 'There are no working bikes' if @working_docked_bikes.empty?
    @working_docked_bikes.pop
  end

  def dock(bike)
    raise 'Dockingstation is full' if full?
    @broken_docked_bikes << bike if bike.working == false
    @working_docked_bikes << bike if bike.working == true
  end

  private

  def full?
    @working_docked_bikes.length + @broken_docked_bikes.length == DEFAULT_CAPACITY
  end

  def empty?
    @broken_docked_bikes.empty? && @working_docked_bikes.empty?
  end
end
