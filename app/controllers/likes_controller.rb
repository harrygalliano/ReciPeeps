# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :find_recipe, :find_like, only: [:destroy]

  def create
    @recipe = find_recipe

    if already_liked?
    else
      @recipe.likes.create(user_id: current_user.id)
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    if !already_liked?
    else
      @like.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  private

    def already_liked?
      Like.where(user_id: current_user.id, recipe_id:
      params[:recipe_id]).exists?
    end

    def find_recipe
      @recipe = Recipe.find(params[:recipe_id])
    end

    def find_like
      @like = @recipe.likes.find(params[:id])
   end
end
