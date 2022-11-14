class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement
  def initialize(hash)
    @name = hash[:name]
    @min_height = hash[:min_height]
    @admission_fee = hash[:admission_fee]
    @excitement = hash[:excitement]
  end
end
