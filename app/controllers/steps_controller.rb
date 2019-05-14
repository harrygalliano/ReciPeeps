class StepsController < ApplicationController

def new
    @step = Step.new
  end

  def create
    description = params[:step][:description]
    id = params[:id]
    Step.create(description: description, recipe_id: id)
    redirect_to "/recipes/#{id}"
  end
end
