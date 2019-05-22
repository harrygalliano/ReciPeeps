# frozen_string_literal: true

require "rails_helper"

RSpec.describe RecipesController, type: :controller do
  before(:each) do
    @user = User.create(name: "test", email: "test@test.com", password: "123456", password_confirmation: "123456")
    session[:user_id] = @user.id
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      recipe = Recipe.create(name: "Lasagne", description: "Tastes real nice", user_id: @user.id, preparation_time: "01:30", servings: 2)
      get :new, params: { id: recipe.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new recipe" do
      post :create, params: { recipe: { name: "Test recipe", description: "Test description", preparation_time: "01:30", servings: 2 } }
      expect(Recipe.find_by(name: "Test recipe")).to_not eq nil
    end

    it "does not create a recipe if user is not logged in" do
      session.delete(:user_id)
      expect(Recipe).to_not receive(:create)
      post :create, params: { recipe: { name: "Test recipe", description: "Test description", preparation_time: "01:30", servings: 2 } }
    end

    it "creates a flash error if recipe field is empty" do
      post :create, params: { recipe: { name: "", description: "Test description", preparation_time: "01:30", servings: 2 } }
      expect(flash[:danger]).to match(/Cannot submit empty field./)
    end

    it "attaches an uploaded file to a recipe" do
      file = fixture_file_upload(Rails.root.join("public", "apple-touch-icon.png"), "image/png")
      expect do
        post :create, params: { recipe: { name: "Test recipe",
                                          description: "Test description", image: file, preparation_time: "01:30", servings: 2 } }
      end
        .to change(ActiveStorage::Attachment, :count).by(1)
    end
  end

  describe "POST #filter" do
    it "filters and finds recipes that have a specific ingredient" do
      recipe1 = Recipe.create(name: "Lasagne", description: "Tasty dish", user_id: @user.id, preparation_time: "01:30", servings: 2)
      recipe2 = Recipe.create(name: "Lasagne 2", description: "Tasty dish 2", user_id: @user.id, preparation_time: "02:30", servings: 4)
      recipe3 = Recipe.create(name: "Lasagne 3", description: "Tasty dish 3", user_id: @user.id, preparation_time: "03:30", servings: 6)
      Ingredient.create(name: "Caviar", value: 2, unit: "units", recipe_id: recipe1.id)
      Ingredient.create(name: "Caviar", value: 2, unit: "units", recipe_id: recipe2.id)
      Ingredient.create(name: "Cheese", value: 200, unit: "grams", recipe_id: recipe3.id)
      post :filter, params: { search_bar_input: "Caviar" }
      expect(assigns(:recipes).count).to eq 2
      expect(assigns(:filter_message)).to eq "Filtered by ingredient: caviar"
    end
    it "filter is not case sensitive" do
      recipe1 = Recipe.create(name: "Lasagne", description: "Tasty dish", user_id: @user.id, preparation_time: "01:30", servings: 2)
      recipe2 = Recipe.create(name: "Lasagne 2", description: "Tasty dish 2", user_id: @user.id, preparation_time: "02:30", servings: 4)
      Ingredient.create(name: "Caviar", value: 2, unit: "units", recipe_id: recipe1.id)
      Ingredient.create(name: "cAvIaR", value: 2, unit: "units", recipe_id: recipe2.id)
      post :filter, params: { search_bar_input: "caviar" }
      expect(assigns(:recipes).count).to eq 2
    end
  end

  describe "GET #user_filter" do
    it "filters and finds recipes that have a specific ingredient" do
      user2 = User.create(name: "test2", email: "test2@test.com", password: "123456", password_confirmation: "123456")
      recipe1 = Recipe.create(name: "Lasagne", description: "Tasty dish", user_id: @user.id, preparation_time: "01:30", servings: 2)
      recipe2 = Recipe.create(name: "Lasagne 2", description: "Tasty dish 2", user_id: @user.id, preparation_time: "02:30", servings: 4)
      recipe3 = Recipe.create(name: "Lasagne 3", description: "Tasty dish 3", user_id: user2.id, preparation_time: "03:30", servings: 6)
      get :user_filter, params: { user_id: @user.id }
      expect(assigns(:recipes).count).to eq 2
      expect(assigns(:filter_message)).to eq "Filtered by user: test"
    end
  end
end
