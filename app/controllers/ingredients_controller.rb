class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    recipe_id = params[:id] 
    add_ingredients(recipe_id)
    redirect_to "/steps/#{recipe_id}/new"
  end

  def add_ingredients(id)
    params.each do |param|
      next if param.slice(0..11) != 'ingredients_'
      hash = params[param]
      Ingredient.create(name: hash[:name], unit: hash[:unit], value: hash[:value], recipe_id: id)
    end
  end
end
