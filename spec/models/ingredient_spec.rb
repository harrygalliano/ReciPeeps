require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  before(:each) do
    @user = User.create(name: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.create(name: 'lasagne', description: 'Tasty AF', user_id: @user.id)
    @id = @recipe.id
  end

  it 'Should reject an ingredient that is missing a name' do
    ingred = Ingredient.create(recipe_id: @id,
                               value: 2.0, unit: 'units')
    expect(ingred.valid?).to eq false
  end
  it 'Should reject an ingredient that is missing a value' do
    ingred = Ingredient.create(recipe_id: @id,
                               name: 'tomato', unit: 'units')
    expect(ingred.valid?).to eq false
  end
  it 'Should reject an ingredient that is missing a unit' do
    ingred = Ingredient.create(recipe_id: @id,
                               value: 2.0, name: 'tomato')
    expect(ingred.valid?).to eq false
  end
  it 'Should reject an ingredient that is missing a recipe_id' do
    ingred = Ingredient.create(name: 'tomato',
                               value: 2.0, unit: 'units')
    expect(ingred.valid?).to eq false
  end
  it 'Should reject an ingredient that is missing a name' do
    ingred = Ingredient.create(recipe_id: @id,
                               value: 2.0, unit: 'units')
    expect(ingred.valid?).to eq false
  end
  it 'Should accept an ingredient that has all required params' do
    ingred = Ingredient.create(recipe_id: @id, name: 'tomato',
                               value: 2.0, unit: 'units')
    expect(ingred.valid?).to eq true
  end
end
