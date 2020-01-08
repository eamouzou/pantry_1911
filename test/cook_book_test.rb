require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/cook_book'

class CookBookTest < Minitest::Test
  def setup
    @cookbook = CookBook.new
    @ingredient1 = Ingredient.new("Cheese", "C", 100)
    @ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @ingredient3 = Ingredient.new("Ground Beef", "oz", 100)
    @ingredient4 = Ingredient.new("Bun", "g", 1)
    @recipe2 = Recipe.new("Burger")
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 100)
  end

  def test_it_exists
    assert_instance_of CookBook, @cookbook
  end

  def test_has_no_recipes
    assert_equal [], @cookbook.recipes
  end

  def test_add_recipe
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end

  def test_summary
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    expected = [{:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}]

    assert_equal expected, @cookbook.summary
  end



end
