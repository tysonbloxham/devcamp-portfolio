require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  describe "registration" do
    it 'creates a new user' do
      expect(@user).to be_valid
    end
  end

  describe "validation" do
    it 'creates a user with no name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end  

    it 'creates a user with no email' do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it 'creates a user with improper email' do
      @user.email = "Something"
      expect(@user).to_not be_valid
    end 

    it 'creates a user with no password' do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it 'creates a user with non-matching password confirmation' do
      @user.password_confirmation = "wrong password"
      expect(@user).to_not be_valid
    end 
  end
end 