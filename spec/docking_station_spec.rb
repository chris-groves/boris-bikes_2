require 'docking_station'

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }

  it 'releases a working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it 'it docks bikes' do
    docking_station = DockingStation.new
    bike = subject.release_bike
    docking_station.dock(bike)
    expect(docking_station.docked_bikes).to eq [bike]
  end
end
