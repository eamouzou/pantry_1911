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

  def recipe_hash
    sorted_ingredients = ingredients.sort_by {|ing| (ing.calories / total_calories.to_f) * 100 }
    ingredients_array = []
    sorted_ingredients.each do |ingredient|
      string = " oz" if ingredient.name == "Macaroni" || ingredient.name == "Ground Beef"
      string = " C" if ingredient.name == "Cheese"
      string = " g" if ingredient.name == "Bun"
      ingredients_array << {ingredient: ingredient.name, amount: amount_required(ingredient).to_s + string}
    end

    full = {ingredients: ingredients_array, total_calories: total_calories }
  end
end
