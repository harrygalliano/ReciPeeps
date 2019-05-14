require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to be }

 it 'Should reject a user that is missing a name' do
   user = User.create( { email: 'test@testmail.com',  } )
   expect(user.valid?).to eq false;
 end

 it 'Should reject a user that is missing an email' do
   user = User.create( { name: 'Test' } )
   expect(user.valid?).to eq false;
 end

 it 'Should reject an email that has an incorrect format' do
   user = User.create( { name: 'Test', email: '@testmail.com' } )
   expect(user.valid?).to eq false;
 end

 it 'Should reject a name that is longer than 20 characters' do
   user = User.create( { name: 'T' * 21, email: 'test@testmail.com' } )
   expect(user.valid?).to eq false;
 end
end
