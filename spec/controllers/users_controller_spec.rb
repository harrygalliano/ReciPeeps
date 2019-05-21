require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'adds a user to users database' do
      post :create, params: { user: { name: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456' } }
      expect(User.find_by(email: 'test@test.com')).to_not eq nil
    end
    it "refreshes page if user didn't save" do
      expect(
        post(:create, params: {
               user: { name: 'test',
                       email: 'test@test.com',
                       password: '123',
                       password_confirmation: '1' }
             })
      ).to render_template('users/new')
    end
    it 'redirects to log in page if sign up succesful' do
      expect(
        post(:create, params: {
               user: { name: 'test',
                       email: 'test@test.com',
                       password: '123456',
                       password_confirmation: '123456' }
             })
      ).to redirect_to('/login')
    end
  end

  describe 'GET #find' do
    it 'redirects to show page for logged in user' do
      user = User.create(name: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456')
      session[:user_id] = user.id
      expect(get(:find)).to redirect_to "/users/#{user.id}"
    end
  end
end
