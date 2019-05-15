require 'rails_helper'

RSpec.describe Step, type: :model do

  before(:each) do
    @recipe = Recipe.create(name: 'lasagne', description: 'Tasty AF')
    @id = @recipe.id
  end

  it 'Should reject a step that is missing a description' do
    step = Step.create(recipe_id: @id)
    expect(step.valid?).to eq false;
  end
  it 'Should reject a step that is missing a recipe_id' do
    step = Step.create(description: 'Do this')
    expect(step.valid?).to eq false;
  end
  it 'Should store a step that has description and recipe_id' do
    step = Step.create(description: 'Do this', recipe_id: @id)
    expect(step.valid?).to eq true;
  end
end
