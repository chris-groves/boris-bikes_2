require 'docking_station'

describe DockingStation do
  it { expect(subject).to respond_to :release_bike }
end
