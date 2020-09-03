require 'docking_station'
require 'pry'

describe DockingStation do
  it 'releases a working bike' do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike)
    station.release_bike
    expect(bike.working).to eq true
  end

  it 'does not release a broken bike' do
    station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    station.dock(bike)
    expect { station.release_bike }.to raise_error('There are no working bikes')
  end

  it 'docks a working bike' do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike)
    expect(station.working_docked_bikes).to eq [bike]
  end

  it 'docks a broken bike' do
    station = DockingStation.new
    bike = Bike.new
    bike.report_broken
    station.dock(bike)
    expect(station.broken_docked_bikes).to eq [bike]
  end

  it 'prevents bikes being docked when capacity is reached' do
    docking_station = DockingStation.new
    DockingStation::DEFAULT_CAPACITY.times { docking_station.dock(Bike.new) }
    expect { docking_station.dock(Bike.new) }.to raise_error('Dockingstation is full')
  end

  it 'allows a custom capacity to be set' do
    station = DockingStation.new(25)
    expect(station.capacity).to eq 25
  end

  it 'has a default capacity' do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  describe '#release_bike' do
    it 'prevents the release of bikes if docking station is empty' do
      station = DockingStation.new
      expect { station.release_bike }.to raise_error('Dockingstation is empty')
    end
  end
end
