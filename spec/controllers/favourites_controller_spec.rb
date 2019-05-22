# frozen_string_literal: true

require "rails_helper"

RSpec.describe FavouritesController, type: :controller do
  before(:each) do
    @user = User.create(name: "test", email: "test@test.com", password: "123456", password_confirmation: "123456")
    @recipe = Recipe.create(name: "Lasagne", description: "Tastes real nice", user_id: @user.id, preparation_time: "01:30", servings: 2)
    @recipe2 = Recipe.create(name: "Pasta", description: "Tastes real good", user_id: @user.id, preparation_time: "02:30", servings: 4)
    session[:user_id] = @user.id
  end

  describe "POST #create" do
     it "adds a favourite to the database" do
        post :create, params: { recipe_id: @recipe.id }
        expect(Favourite.find_by(recipe_id: @recipe.id)).to_not eq nil
      end
     it "refreshes page if favourite was successful" do
        expect(
          post :create, params: { recipe_id: @recipe.id }
        ).to redirect_to("/")
      end
   end

  describe "POST #destroy" do
    it "deletes a favourite from the database" do
      post :create, params: { recipe_id: @recipe.id }
      favourite = Favourite.find_by(recipe_id: @recipe.id)
      delete :destroy, params: { recipe_id: @recipe.id, id: favourite.id }
      expect(Favourite.find_by(recipe_id: @recipe.id)).to eq nil
    end
  end

  describe "GET #index" do
    it "gets all favourites for current user" do
      post :create, params: { recipe_id: @recipe.id }
      post :create, params: { recipe_id: @recipe2.id }
      get :index
      expect(assigns(:recipes).count).to eq 2
    end
  end
end
