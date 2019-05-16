require 'rails_helper'

RSpec.describe StepsController, type: :controller do

  before(:each) do
    @user = User.create(name: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.create(name: 'Lasagne', description: 'Tastes real nice', user_id: @user.id)
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
    it "can add multiple steps to steps table" do
      post :create, params: { id: @id, steps_1: { description: "Test step 1" },
        steps_2: { description: "Test step 2" } }
      expect(Step.find_by(description: 'Test step 1')).to_not eq nil
      expect(Step.find_by(description: 'Test step 2')).to_not eq nil
    end
    it "redirects to method page" do
      post :create, params: { id: @id, steps_1: { description: "Test step" } }
      expect(Step.find_by(description: 'Test step'))
        .to redirect_to("/recipes/#{@recipe.id}")
    end
  end
end
