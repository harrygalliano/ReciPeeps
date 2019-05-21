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
      Step.create(description: param[1]['description'], recipe_id: id)
    end
  end
end
