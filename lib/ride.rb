class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :total_revenue,
              :rider_log
  def initialize(hash)
    @name = hash[:name]
    @min_height = hash[:min_height]
    @admission_fee = hash[:admission_fee]
    @excitement = hash[:excitement]
    @total_revenue = 0
    @rider_log = {}
  end
  
  def board_rider(visitor)
    if !rider_log.keys.include?(visitor)
      rider_log[visitor] = 1
      @total_revenue += (@admission_fee)
      visitor.spend(@admission_fee)
      # require 'pry';binding.pry
    else 
      rider_log[visitor] += 1
      @total_revenue += (@admission_fee)
      visitor.spend(@admission_fee)
    end
  end
end
# require 'pry';binding.pry