# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def show
    @user = User.find(params[:id])
    @recipes = Recipe.where(user_id: @user.id).paginate(page: params[:page], per_page: 12)
  end

  def find
    redirect_to "/users/#{current_user.id}"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Recipeeps!"
      redirect_to "/login"
    else
      render "new"
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to "/users/#{current_user.id}"
    else
      render "edit"
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :description)
    end
end
