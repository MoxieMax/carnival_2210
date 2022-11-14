class Carnival
  attr_reader :duration,
              :rides
  def initialize(duration)
    @duration = duration
    @rides = []
  end
  
  def add_ride(ride)
    rides << ride
  end
  
  def most_popular
    #in ride, create a method to count total times ridden, 
  end
  
  def most_profitable
    rides.max_by do |ride|
      ride.total_revenue
    end
  end
  
  def total_revenue
    rides.map do |ride|
      ride.total_revenue
    end.sum
  end
end