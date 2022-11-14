require 'pry'
require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  describe '#iteration 2' do
    let (:ride1) {Ride.new({ name: 'Carousel', min_height: 24, admission_fee: 1, excitement: :gentle })}
    it '#initialize exists and has readable attributes' do
      expect(ride1).to be_a(Ride)
      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
    end
  end
end

# expect(ride).to eq()