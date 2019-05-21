class FavouritesController < ApplicationController
before_action :find_recipe, except: [:index]
before_action :find_favourite, only: [:destroy]

  def create
    if already_favourited?
    else
      @recipe.favourites.create(user_id: current_user.id)
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    if !(already_favourited?)
    else
      @favourite.destroy
    end
    redirect_back(fallback_location: root_path)
  end

  def index
    favourites = Favourite.where(user_id: current_user.id).map do |favourite|
      favourite.recipe_id
    end
    @recipes = Recipe.where(id: favourites).paginate(page: params[:page], per_page: 10)
  end

  private

  def find_recipe
   @recipe = Recipe.find(params[:recipe_id])
  end

  def find_favourite
    @favourite = @recipe.favourites.find(params[:id])
  end

  def already_favourited?
    Favourite.where(user_id: current_user.id, recipe_id:
    params[:recipe_id]).exists?
  end
end
