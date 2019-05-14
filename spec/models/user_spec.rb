require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to be }

 it 'Should reject a user that is missing a name' do
   user = User.create( { email: 'test@testmail.com',
     password: "password", password_confirmation: "password"  } )
   expect(user.valid?).to eq false;
 end

 it 'Should reject a user that is missing an email' do
   user = User.create( { name: 'Test',
     password: "password", password_confirmation: "password" } )
   expect(user.valid?).to eq false;
 end

 it 'Should reject an email that has an incorrect format' do
   user = User.create( { name: 'Test', email: '@testmail.com',
     password: "password", password_confirmation: "password" } )
   expect(user.valid?).to eq false;
 end

 it 'Should reject a name that is longer than 20 characters' do
   user = User.create( { name: 'T' * 21, email: 'test@testmail.com',
     password: "password", password_confirmation: "password" } )
   expect(user.valid?).to eq false;
 end

 it 'Should accept an email that is not lowercase' do
   user = User.create( { name: 'Test', email: 'TEST@TESTMAIL.COM',
     password: "password", password_confirmation: "password" } )
   expect(user.valid?).to eq true;
 end

 it 'Should accept a user with a confirmed password' do
   user = User.create( { name: 'Test', email: 'TEST@TESTMAIL.COM',
     password: "password", password_confirmation: "password" } )
   expect(user.valid?).to eq true;
 end

 it 'Should reject a password less than 6 characters long' do
   user = User.create( { name: 'Test', email: 'TEST@TESTMAIL.COM',
     password: "p", password_confirmation: "p" } )
   expect(user.valid?).to eq false;
 end

end
