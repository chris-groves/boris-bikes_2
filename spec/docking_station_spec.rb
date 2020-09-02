require 'docking_station'
require 'pry'

describe DockingStation do
  it 'releases a working bike' do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike)
    station.release_bike
    expect(bike).to be_working
  end

  it 'it docks bikes' do
    docking_station = DockingStation.new
    bike = Bike.new
    docking_station.dock(bike)
    expect(docking_station.docked_bikes).to eq [bike]
  end

  describe '#release_bike' do
    it 'prevents the release of bikes if docking station is empty' do
      station = DockingStation.new
      expect { station.release_bike }.to raise_error('Dockingstation is empty')
    end
  end
end
