require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'should not allow nulls in description or name' do
    user = User.create(name: 'test', email: 'test@test.com', password: '123456', password_confirmation: '123456')
    Recipe.create(name: nil, description: 'test desc', user_id: user.id)
    Recipe.create(name: 'test name', description: nil, user_id: user.id)
    expect(Recipe.count).to eq 0
  end
end
