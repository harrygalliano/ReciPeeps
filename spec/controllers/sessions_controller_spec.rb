require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST sessions#create' do
    it 'should show user is in session after log in' do
      user = User.create(email: 'test@test.com', password: '123456')
      post :create, params: {session: {email: 'test@test.com', password: '123456'} }
      expect(session[:user_id]).to eq user.id
    end

    it 'should show user is not in session after unsucessful log in' do
      user = User.create(email: 'test@test.com', password: '12345689')
      post :create, params: {session: {email: 'test@test.com', password: '123456'} }
      expect(session[:user_id]).to_not be
    end
  end

  describe 'DELETE sessions#destroy' do
    it 'should show user is no longer in session' do
      user = User.create(email: 'test@test.com', password: '123456')
      post :create, params: {session: {email: 'test@test.com', password: '123456'} }
      delete :destroy
      expect(session[:user_id]).to_not be
    end
  end

end
