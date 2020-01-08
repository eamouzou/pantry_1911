class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new {|hash, key| hash[key] = 0}
  end

  def stock_check(ingredient)
    if @stock.include?(ingredient)
      (@stock.find {|ing, amount| ing == ingredient})[1]
    else
      0
    end
  end

  def restock(ingredient, amount)
     @stock[ingredient] += amount
  end


end
