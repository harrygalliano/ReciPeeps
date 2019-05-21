class CommentsController < ApplicationController
  def create
    Comment.create(comment: params[:comment],
                   user_id: current_user.id, recipe_id: params[:recipe_id])
    redirect_to "/recipes/#{params[:recipe_id]}"
  end
end
