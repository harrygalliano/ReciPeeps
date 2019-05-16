require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  before(:each) do
    @recipe = Recipe.create(name: 'Lasagne', description: 'Tastes real nice')
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { id: @recipe.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "adds an ingredient to ingredients table" do
      post :create, params: { id: @recipe.id,
        ingredients_1: { name: "Test ingredient", value: 3.0, unit: "test" } }
      expect(Ingredient.find_by(name: 'Test ingredient')).to_not eq nil
    end
    it "adds multiple ingredients to ingredients table" do
      post :create, params: { id: @recipe.id,
        ingredients_1: { name: "Test ingredient 1", value: 3.0, unit: "test" },
        ingredients_2: { name: "Test ingredient 2", value: 3.0, unit: "test" } }
      expect(Ingredient.find_by(name: 'Test ingredient 1')).to_not eq nil
      expect(Ingredient.find_by(name: 'Test ingredient 2')).to_not eq nil
    end
    it "redirects to method page" do
      expect(
        post :create, params: {
          id: @recipe.id, ingredients_1: {
            name: "Test ingredient", value: 3.0, unit: "test"
            }
          }
      ).to redirect_to("/steps/#{@recipe.id}/new")
    end
  end
end
