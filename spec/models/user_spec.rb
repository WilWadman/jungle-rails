require 'rails_helper'
require 'shoulda/matchers'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    
    it { should validate_confirmation_of(:password) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:password).is_at_least(8) }
  end

  describe '.authenticate_with_credentials' do

    it 'should return a user if the email and password are valid' do
     user = User.create(email: 'user@example.com', password: 'password', name: 'Bob')
     user.save
     if user
      puts "User was saved to the database"
    else
      puts "User was not saved to the database"
    end
      expect(User.authenticate_with_credentials('user@example.com', 'password')).to eq(user)
    end

    it 'should return nil if the email is invalid' do
      User.create(email: 'user@example.com', password: 'password')
      expect(User.authenticate_with_credentials('invalid@example.com', 'password')).to be_nil
    end

    it 'should return nil if the password is invalid' do
      User.create(email: 'user@example.com', password: 'password')
      expect(User.authenticate_with_credentials('user@example.com', 'invalid')).to be_nil
    end

    it 'should be case-insensitive for the email' do
      user =  User.create(email: 'user1@example.com', password: 'password', name: 'Bob')
      user.save
      if user
        puts "User was saved to the database"
      else
        puts "User was not saved to the database"
      end
      expect(User.authenticate_with_credentials('USER1@EXAMPLE.COM', 'password')).to eq(user)
    end
  end
end
