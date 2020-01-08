require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def setup
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @recipe = Recipe.new("Mac and Cheese")
  end

  def test_it_exists
    assert_instance_of Recipe, @recipe
  end

  def test_name
    assert_equal "Mac and Cheese", @recipe.name
  end

  def test_ingredients_required
    assert_equal ({}), @recipe.ingredients_required
  end

  def test_add_ingredients
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal ({@ingredient1 => 2, @ingredient2 => 8}), @recipe.ingredients_required
  end

  def test_amount_required
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 2, @recipe.amount_required(@ingredient1)
    assert_equal 8, @recipe.amount_required(@ingredient2)
  end

  def test_ingredients
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal [@ingredient1, @ingredient2], @recipe.ingredients
  end

  def test_total_calories
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    assert_equal 440, @recipe.total_calories
  end

  def test_recipe_hash
    @recipe.add_ingredient(@ingredient1, 2)
    @recipe.add_ingredient(@ingredient2, 8)

    expected = {:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"},
      {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}

    assert_equal expected, @recipe.recipe_hash
  end
end
