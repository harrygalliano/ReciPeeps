class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    name = params[:recipe][:name]
    description = params[:recipe][:description]
    recipe = Recipe.create(name: name, description: description)
    redirect_to "/ingredients/#{recipe.id}/new"
  end

  def show
    id = params[:id]
    @recipe = Recipe.find(id)
    @ingredients = Ingredient.where(recipe_id: id)
    @steps = Step.where(recipe_id: id)
  end

  def index
    @recipes = Recipe.all
  end

end
