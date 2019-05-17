class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    id = current_user.id
    name = params[:recipe][:name]
    description = params[:recipe][:description]
    p name
    p description
    if name.empty? || description.empty?
      flash[:danger] = 'Cannot submit empty field.'
      redirect_to "/recipes/new"
    else
      recipe = Recipe.create(name: name, description: description, user_id: id)
      redirect_to "/ingredients/#{recipe.id}/new"
    end
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
