# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def show
    @user = User.find(params[:id])
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

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
