class RecipesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]

  def new
    @recipe = Recipe.new
  end

  def create
    id = current_user.id
    name = params[:recipe][:name]
    description = params[:recipe][:description]
    image = params[:recipe][:image]

    if name.empty? || description.empty?
      flash[:danger] = 'Cannot submit empty field.'
      redirect_to "/recipes/new"
    else
      recipe = Recipe.create(name: name, description: description, user_id: id)
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
    @recipes = Recipe.where(id: recipe_ids).paginate(page: params[:page], per_page: 10)
    render 'index'
  end

  def show
    id = params[:id]
    @comments = Comment.where(recipe_id: id)
    @recipe = Recipe.find(id)
    @ingredients = Ingredient.where(recipe_id: id)
    @steps = Step.where(recipe_id: id)
  end

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 10)
  end
end
