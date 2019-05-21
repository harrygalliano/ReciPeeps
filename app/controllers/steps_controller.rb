<<<<<<< HEAD
=======
# frozen_string_literal: true

>>>>>>> b0487b3a9b34e68ed1233ae3132324c23454adbb
class StepsController < ApplicationController
  def new
    @step = Step.new
  end

  def create
    add_steps(params[:id])
    redirect_to "/recipes/#{params[:id]}"
  end

  def add_steps(id)
    params.each do |param|
      Step.create(description: param[1]["description"], recipe_id: id)
    end
  end
end
