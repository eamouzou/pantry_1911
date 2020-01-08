class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def summary
    summary = []
    @recipes.each do |recipe|
      detailshash = {}
      recipe_hash = {name: recipe.name, details: detailshash}
      summary << recipe_hash
    end
    # require "pry"; binding.pry

  end




{:ingredients=>[{:ingredient=>"Macaroni",
  :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}




end
