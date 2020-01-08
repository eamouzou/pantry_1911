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
      recipe_hash = {name: recipe.name, details: recipe.recipe_hash}
      summary << recipe_hash
    end
    summary
  end




{:ingredients=>[{:ingredient=>"Macaroni",
  :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}




end
