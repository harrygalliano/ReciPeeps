class RecipesController < ApplicationController

  def new
    @recipe = Recipe.new
  end

  def create
    name = params[:recipe][:name]
    description = params[:recipe][:description]
    Recipe.create(name: name, description: description)
  end

end
