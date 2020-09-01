require 'docking_station'

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }

  it 'releases a working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
end
