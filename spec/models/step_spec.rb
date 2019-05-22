# frozen_string_literal: true

require "rails_helper"

RSpec.describe Step, type: :model do
  before(:each) do
    @user = User.create(name: "test", email: "test@test.com", password: "123456", password_confirmation: "123456")
    @recipe = Recipe.create(name: "lasagne", description: "Tasty AF", user_id: @user.id, preparation_time: "01:30", servings: 2)
    @id = @recipe.id
  end

  it "Should reject a step that is missing a description" do
    step = Step.create(recipe_id: @id)
    expect(step.valid?).to eq false
  end
  it "Should reject a step that is missing a recipe_id" do
    step = Step.create(description: "Do this")
    expect(step.valid?).to eq false
  end
  it "Should store a step that has description and recipe_id" do
    step = Step.create(description: "Do this", recipe_id: @id)
    expect(step.valid?).to eq true
  end
end
