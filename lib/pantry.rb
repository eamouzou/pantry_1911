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

  def enough_ingredients_for?(recipe)
    enough = false
    recipe.ingredients_required.each do |recipe_ingredient|
      if stock.include?(recipe_ingredient[0])
        stock_ingredient = stock.find {|ing, amount| ing == recipe_ingredient[0]}
        stock_amount = stock_ingredient[1]
        amount_required = recipe_ingredient[1]
        if stock_amount >= amount_required
          enough = true
        else
          enough = false
        end
      else
        enough = false
      end
    end
    enough
  end


end
