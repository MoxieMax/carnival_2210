require 'pry'
require './lib/visitor'

RSpec.describe Visitor do
  describe '#iteration 1' do
    let (:visitor) {Visitor.new('Bruce', 54, '$10')}
    it '#initialize exists and has readable attributes' do
      expect(visitor).to be_a(Visitor)
      expect(visitor.name).to eq('Bruce')
      expect(visitor.height).to eq(54)
      expect(visitor.spending_money).to eq(10)
      expect(visitor.preferences).to eq([])
    end
  end
end

# expect(visitor).to eq()