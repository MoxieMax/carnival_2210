require 'pry'
require './lib/visitor'
require './lib/ride'

RSpec.describe Ride do
  describe '#iteration 2' do
    
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
    
    before(:each) do
      visitor1.add_preference(:gentle)
      visitor2.add_preference(:gentle)
      visitor2.add_preference(:thrilling)
      visitor3.add_preference(:thrilling)
    end
    
    it '#initialize exists and has readable attributes' do
      expect(ride1).to be_a(Ride)
      expect(ride1.name).to eq('Carousel')
      expect(ride1.min_height).to eq(24)
      expect(ride1.admission_fee).to eq(1)
      expect(ride1.excitement).to eq(:gentle)
      expect(ride1.total_revenue).to eq(0)
      expect(ride1.rider_log).to eq({})
    end
    
    it '#board_rider places a visitor on a ride, updates #rider_log' do
      ride1.board_rider(visitor1)
      expect(ride1.rider_log).to eq({visitor1 => 1})
      
      ride1.board_rider(visitor2)
      expect(ride1.rider_log).to eq({visitor1 => 1, visitor2 => 1})
      
      ride1.board_rider(visitor1)
      expect(ride1.rider_log).to eq({visitor1 => 2, visitor2 => 1})
      
      expect(visitor1.spending_money).to eq(8)
      expect(visitor2.spending_money).to eq(4)
      expect(ride1.total_revenue).to eq(3)
    end
    
    it 'expanded testing of #board_rider' do
      ride3.board_rider(visitor1)
      ride3.board_rider(visitor2)
      ride3.board_rider(visitor3)
      
      expect(visitor1.spending_money).to eq(10)
      expect(visitor2.spending_money).to eq(5)
      expect(visitor3.spending_money).to eq(13)
      
      expect(ride3.rider_log).to eq({visitor3 => 1})
      
      expect(ride3.total_revenue).to eq(2)
    end
    
    it '#times_ridden can count the number of times a a ride is ridden' do
      3.times {ride1.board_rider(visitor1)}
      2.times {ride1.board_rider(visitor2)}
      expect(ride1.times_ridden).to eq(5)
    end
  end
end