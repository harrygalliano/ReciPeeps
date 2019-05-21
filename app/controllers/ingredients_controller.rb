<<<<<<< HEAD
=======
# frozen_string_literal: true

>>>>>>> b0487b3a9b34e68ed1233ae3132324c23454adbb
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
<<<<<<< HEAD
      Ingredient.create(name: param[1]['name'],
                        unit: param[1]['unit'],
                        value: param[1]['value'],
=======
      Ingredient.create(name: param[1]["name"],
                        unit: param[1]["unit"],
                        value: param[1]["value"],
>>>>>>> b0487b3a9b34e68ed1233ae3132324c23454adbb
                        recipe_id: id)
    end
  end
end
