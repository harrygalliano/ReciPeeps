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
      next if param.slice(0..5) != 'steps_'
      hash = params[param]
      Step.create(description: hash[:description], recipe_id: id)
    end
  end
end
