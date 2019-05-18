class IngredientsController < ApplicationController

  def new
    @ingredient = Ingredient.new
  end

  def create
    recipe_id = params[:id]

    # if any_empty_fields?
    #   flash.now[:danger] = 'Cannot submit empty field.'

    # else
      add_ingredients(recipe_id)
      redirect_to "/steps/#{recipe_id}/new"
    # end
  end

  def add_ingredients(id)
    params.each do |param|
      Ingredient.create(name: param[1]['name'],
        unit: param[1]['unit'],
        value: param[1]['value'],
        recipe_id: id)
    end
  end

  def any_empty_fields?
    params.each do |param|
      return true if param[1]['name'].nil? || param[1]['unit'].nil? || param[1]['value'].nil?
    end
  end
end
