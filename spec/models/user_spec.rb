require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user model input" do
    it 'should test all required fields' do
      @user = User.new
      @user.first_name = "Jane"
      @user.last_name = "Doe"
      @user.email = "c@c.com"
      @user.password = "123"
      @user.password_confirmation = "123"
      expect(@user).to be_valid
      @user.save
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
  end
end
