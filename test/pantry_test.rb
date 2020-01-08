require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test
  def setup
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new("Cheese", "C", 50)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 200)
    @recipe = Recipe.new("Mac and Cheese")
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)
  end

  def test_it_exists
    assert_instance_of Pantry, @pantry
  end

  def test_stock
    assert_equal ({}), @pantry.stock
  end
end
