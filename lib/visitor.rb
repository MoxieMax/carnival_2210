class Visitor
  attr_reader :name,
              :height,
              :spending_money,
              :preferences
  def initialize(name, height, spending_money)
    @name = name
    @height = height
    @spending_money = spending_money.delete('$').to_i
    @preferences = []
  end
  
  def add_preference(preference)
    @preferences << preference
  end
  
  def tall_enough?(num)
    if @height >= num
      true
    else
      false
    end
  end
  
  def match_pref?(preference)
    if @preferences.include?(preference)
      true
    else 
      false
    end
  end
  
  def spend(sum)
    @spending_money -= sum
  end
  
  def eligible?
    match_pref && tall_enough
  end
end
