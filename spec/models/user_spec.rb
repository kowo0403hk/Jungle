require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model input" do
    it 'should test all required fields be valid' do
      @user = User.new
      @user.first_name = "Jane"
      @user.last_name = "Doe"
      @user.email = "c@c.com"
      @user.password = "123"
      @user.password_confirmation = "123"
      expect(@user).to be_valid
    end

    it 'should ensure that password and password_confirmation match' do
      @user = User.new
      @user.first_name = "Jane"
      @user.last_name = "Doe"
      @user.email = "c@c.com"
      @user.password = "123"
      @user.password_confirmation = "1234"
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password and password confirmation do not match")
    end

    it 'ensures email is unique (not case sensitive)' do
      @user1 = User.create(first_name: 'John', last_name: 'Doe', email: 'a@a.com', password: '123', password_confirmation: '123') 
      @user2 = User.new
      @user2.first_name = "Jane"
      @user2.last_name = "Doe"
      @user2.email = "A@A.COM"
      @user2.password = "123"
      @user2.password_confirmation = "123"
      expect(@user2).not_to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should provide errors if required fields are missing' do
      @user = User.new
      @user.first_name = nil
      @user.last_name = nil
      @user.email = nil
      @user.password = "123"
      @user.password_confirmation = "123"
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Email can't be blank", "First name can't be blank", "Last name can't be blank")
    end

    it 'should ensure password has a minimum length of 3 characters' do
      @user = User.new
      @user.first_name = "Jane"
      @user.last_name = "Doe"
      @user.email = "c@c.com"
      @user.password = "12"
      @user.password_confirmation = "12"
      expect(@user).not_to be_valid
      expect(@user.errors.full_messages).to include("Password confirmation is too short (minimum is 3 characters)")
    end

    describe ".authenticate_with_credentials" do
      it 'should return a user instance if the password and email matches' do
        # first we need to create an entry to the test database so that AR can search for it
        @user1 = User.create(:first_name => 'John', :last_name => 'Doe', :email => 'a@a.com',:password => '123', :password_confirmation => '123') 
        @user2 = User.authenticate_with_credentials("a@a.com", "123")
        expect(@user2).to be_present
      end

      it 'should return nil if either of the credentials does not match' do
        @user1 = User.create(first_name: 'John', last_name: 'Doe', email: 'a@a.com', password: '123', password_confirmation: '123') 
        @user2 = User.authenticate_with_credentials("a@a.com", "12")
        expect(@user2).to be_nil
      end

      it 'should take care of the edge cases of preceding or tailing whitespaces, as well as casing of the email' do
        @user1 = User.create(first_name: 'John', last_name: 'Doe', email: 'a@a.com', password: '123', password_confirmation: '123') 
        @user2 = User.authenticate_with_credentials("  a@A.coM  ", "123")
        expect(@user2).to be_present
      end
    end
  end
end
