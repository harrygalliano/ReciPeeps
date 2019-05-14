require 'rails_helper'

RSpec.describe IngredientsController, type: :controller do

  xdescribe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  xdescribe "POST #create" do
    it "adds an ingredient to ingredients database" do
      post :create, :params => { ingredient: { :ingredient1 => "Test ingredient", :value1 => 3.0, :unit1 => "test" } }
      expect(Ingredient.find_by(name: 'Test ingredient')).to_not eq nil
    end
  end

end
