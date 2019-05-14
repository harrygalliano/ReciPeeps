class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    name = params[:ingredient][:name]
    unit = params[:ingredient][:unit]
    value = params[:ingredient][:value]
    id = params[:id]
    Ingredient.create(name: name, unit: unit, value: value, recipe_id: id)
    redirect_to "/steps/#{id}/new"
  end
end
