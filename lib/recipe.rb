class Recipe
  attr_reader :name, :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
  end

  def amount_required(ingredient)
    (@ingredients_required.find {|ing, amount| ingredient == ing})[1]
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @ingredients_required.reduce(0) do |acc, (ingredient, amount)|
      calories = ingredient.calories * amount
      acc += calories
      acc
    end
  end
end
