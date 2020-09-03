require 'bike'

describe Bike do
  it 'can be marked as broken' do
    bike = Bike.new
    bike.report_broken
    expect(bike.working).to eq false
  end
end
