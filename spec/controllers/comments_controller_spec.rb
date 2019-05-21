# frozen_string_literal: true

require "rails_helper"

RSpec.describe CommentsController, type: :controller do
  describe "POST #create" do
    before(:each) do
      @user = User.create(name: "test", email: "test@test.com",
                          password: "123456", password_confirmation: "123456")
      @recipe = Recipe.create(name: "Lasagne",
                              description: "Tastes real nice", user_id: @user.id)
      session[:user_id] = @user.id
    end
    it "creates a comment" do
      post :create, params: { comment: "test comment",
                              recipe_id: @recipe.id, user_id: @user.id }
      expect(Comment.find_by(comment: "test comment")).to be
    end
    it "redirects to recipe show page" do
      expect(post(:create, params: { comment: "test comment",
                                     recipe_id: @recipe.id, user_id: @user.id }))
        .to redirect_to "/recipes/#{@recipe.id}"
    end
  end
end
