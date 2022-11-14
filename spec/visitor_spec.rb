require 'pry'
require './lib/visitor'

RSpec.describe Visitor do
  describe '#iteration 1' do
    
    let (:visitor1) {Visitor.new('Bruce', 54, '$10')}
    let (:visitor2) {Visitor.new('Tucker', 36, '$5')}
    let (:visitor3) {Visitor.new('Penny', 64, '$15')}
    
    it '#initialize exists and has readable attributes' do
      expect(visitor1).to be_a(Visitor)
      expect(visitor1.name).to eq('Bruce')
      expect(visitor1.height).to eq(54)
      expect(visitor1.spending_money).to eq(10)
      expect(visitor1.preferences).to eq([])
    end
    
    it '#add_preference adds to an array' do
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:water)
      expect(visitor1.preferences).to eq([:gentle, :water])
    end
    
    it '#tall_enough determines if a visitor meets the height requirement to ride' do
      expect(visitor1.tall_enough?(54)).to eq(true)
      expect(visitor2.tall_enough?(54)).to eq(false)
      expect(visitor3.tall_enough?(54)).to eq(true)
      expect(visitor1.tall_enough?(64)).to eq(false)
    end
    
    it '#spend_money subtracts from spending money' do
      expect(visitor1.spend(5))
      expect(visitor1.spending_money).to eq(5)
    end
    
    it '#match_pref' do
      visitor1.add_preference(:gentle)
      visitor1.add_preference(:water)
      expect(visitor1.match_pref?(:thrilling)).to eq(false)
      expect(visitor1.match_pref?(:gentle)).to eq(true)
    end
  end
end

# expect(visitor).to eq()