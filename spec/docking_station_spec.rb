require 'docking_station'
require 'pry'

describe DockingStation do
  let(:bike) { double(:bike, working: true) }

  it 'allows a custom capacity to be set' do
    expect(DockingStation.new(25).capacity).to eq 25
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  context 'when a bike is workking' do
    it 'releases a working bike' do
      subject.dock(bike)
      expect(subject.release_bike).to be bike
    end

    it 'docks a working bike' do
      subject.dock(bike)
      expect(subject.working_docked_bikes).to eq [bike]
    end
  end

  context 'when docking station is full' do
    it 'prevents bikes being docked when capacity is reached' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error('Dockingstation is full')
    end
  end

  context 'when docking station is empty' do
    it 'prevents the release of bikes if docking station is empty' do
      expect { subject.release_bike }.to raise_error('Dockingstation is empty')
    end
  end

  context 'when bikes are broken' do
    let(:bike) { double(:bike, working: false) }

    it 'docks a broken bike' do
      subject.dock(bike)
      expect(subject.broken_docked_bikes).to eq [bike]
    end

    it 'does not release a broken bike' do
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error('There are no working bikes')
    end
  end
end
