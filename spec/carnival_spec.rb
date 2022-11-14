require 'pry'
require './lib/visitor'
require './lib/ride'
require './lib/carnival'

RSpec.describe Carnival do
  let (:carnival) {Carnival.new('8 hours')}
  let (:ride1) {Ride.new({name: 'Carousel',
                          min_height: 24,
                          admission_fee: 1,
                          excitement: :gentle
                        })}
  let (:ride2) {Ride.new({name: 'Ferris Wheel',
                          min_height: 36, 
                          admission_fee: 5, 
                          excitement: :gentle
                        })}
  let (:ride3) {Ride.new({name: 'Roller Coaster',
                          min_height: 54, 
                          admission_fee: 2,
                          excitement: :thrilling 
                        })}
  
  let (:visitor1) {Visitor.new('Bruce', 54, '$10')}
  let (:visitor2) {Visitor.new('Tucker', 36, '$5')}
  let (:visitor3) {Visitor.new('Penny', 64, '$15')}
  
  describe '#iteration 3 - initialize' do
    it '#initialize exists and has readable attributes' do
      expect(carnival).to be_a(Carnival)
      expect(carnival.duration).to eq('8 hours')
      expect(carnival.rides).to eq([])
    end
  end
  
  describe 'iteration 3 functionality' do
    before(:each) do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)
      
      carnival.add_ride(ride1)
      carnival.add_ride(ride2)
      carnival.add_ride(ride3)
    end
    
    it '#add_ride can add rides to carnival' do
      expect(carnival.rides).to eq([ride1, ride2, ride3])
    end
  end
end

# expect(carnival.).to eq()
