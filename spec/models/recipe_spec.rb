require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'should not allow nulls in description or name' do
    Recipe.create(name: nil, description:'test desc')
    Recipe.create(name: 'test name', description:nil)
    expect(Recipe.count).to eq 0
  end
end
