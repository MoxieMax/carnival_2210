require 'pry'
require './lib/visitor'

RSpec.describe Visitor do
  describe '#iteration 1' do
    let (:Visitor) {Visitor.new('Bruce', 54, '$10')}
    it '#initialize exists and has readable attributes' do
      expect(visitor).to be_a(Visitor)
      expect(visitor.name).to eq('Bruce')
      expect(visitor.spending_money).to eq(10)
  end
end

# expect(visitor).to eq()