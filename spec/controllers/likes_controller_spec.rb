# frozen_string_literal: true

require "rails_helper"

  before(:each) do
    @user = User.create(name: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.create(name: 'Lasagne', description: 'Tastes real nice', user_id: @user.id)
    session[:user_id] = @user.id
  end

  describe "POST #create" do

    it "adds a like to the database" do
      post :create, params: {recipe_id: @recipe.id}
      expect(Like.find_by(recipe_id: @recipe.id )).to_not eq nil
    end


    it "redirects to the index page if like was successful" do
      expect(post :create, params: {recipe_id: @recipe.id}).to redirect_to('/')
    end
  end

  describe "POST #destroy" do

    it "deletes a like from the database" do
    post :create, params: {recipe_id: @recipe.id}
    like = Like.find_by(recipe_id: @recipe.id)
    delete :destroy, params: {recipe_id: @recipe.id, id: like.id}
    expect(Like.find_by(recipe_id: @recipe.id )).to eq nil
    end

  end


end
