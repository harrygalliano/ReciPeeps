# frozen_string_literal: true

class RecipesController < ApplicationController
  skip_before_action :require_login, only: %i[index show]

  def new
    @recipe = Recipe.new
  end

  def create
    id = current_user.id
    name = params[:recipe][:name]
    description = params[:recipe][:description]
    image = params[:recipe][:image]
    cooking_time = params[:recipe][:cooking_time]
    serving = params[:recipe][:serving]

    if name.empty? || description.empty?
      flash[:danger] = "Cannot submit empty field."
      redirect_to "/recipes/new"
    else
      recipe = Recipe.create(name: name, description: description, user_id: id,
        cooking_time: cooking_time, serving: serving)
      recipe.image.attach(image)
      redirect_to "/ingredients/#{recipe.id}/new"
    end
  end

  def filter
    search_term = params[:search_bar_input].downcase
    ingredients = Ingredient.where("lower(name) = ?", search_term)
    recipe_ids = ingredients.map do |ingredient|
      ingredient.recipe_id
    end
    @recipes = Recipe.where(id: recipe_ids).paginate(page: params[:page], per_page: 12)
    @filter_message = "Filtered by ingredient: #{search_term}"
    render "index"
  end

  def user_filter
    @recipes = Recipe.where(user_id: params[:user_id]).paginate(page: params[:page], per_page: 12)
    @filter_message = "Filtered by user: #{User.find(params[:user_id]).name}"
    render "index"
  end

  def show
    id = params[:id]
    @comments = Comment.where(recipe_id: id)
    @recipe = Recipe.find(id)
    @ingredients = Ingredient.where(recipe_id: id)
    @steps = Step.where(recipe_id: id)
  end

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 12).order("likes_count DESC")
  end

end
