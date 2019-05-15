require 'rails_helper'

RSpec.describe StepsController, type: :controller do

  before(:each) do
    @recipe = Recipe.create(name: 'Lasagne', description: 'Tastes real nice')
    @id = @recipe.id
    @ingredient = Ingredient.create(name: 'test ing', value: 2.0, unit: 'g', recipe_id: @id)
  end

  describe "GET #new" do
    it "returns http success" do
      get :new, params: { id: @recipe.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "adds a step to steps database" do
      post :create, params: { id: @id, steps_1: { description: "Test step" } }
      expect(Step.find_by(description: 'Test step')).to_not eq nil
    end
    it "redirects to method page" do
      post :create, params: { id: @id, steps_1: { description: "Test step" } }
      expect(Step.find_by(description: 'Test step'))
        .to redirect_to("/recipes/#{@recipe.id}")
    end
  end
end
