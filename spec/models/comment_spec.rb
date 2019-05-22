# frozen_string_literal: true

require "rails_helper"

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(name: "test", email: "test@test.com", password: "123456", password_confirmation: "123456")
    @recipe = Recipe.create(name: "lasagne", description: "Tasty AF", user_id: @user.id, preparation_time: "01:30", servings: 2)
  end

  it "Should create valid comment in comments table" do
    comment = Comment.create(comment: "test comment", recipe_id: @recipe.id, user_id: @user.id)
    expect(comment.valid?).to eq true
  end

  it "Should reject a comment that is missing a comment" do
    comment = Comment.create(recipe_id: @recipe.id, user_id: @user.id)
    expect(comment.valid?).to eq false
  end

  it "Should reject a comment that is missing a recipe_id" do
    comment = Comment.create(user_id: @user.id, comment: "test comment")
    expect(comment.valid?).to eq false
  end

  it "Should reject a comment that is missing a user_id" do
    comment = Comment.create(recipe_id: @recipe.id, comment: "test comment")
    expect(comment.valid?).to eq false
  end
end
