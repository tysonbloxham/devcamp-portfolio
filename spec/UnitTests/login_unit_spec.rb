require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  describe "unit registration" do
    it 'creates a new user' do
      expect(@user).to be_valid
    end
  end

  describe "validation" do
    it 'creates a user with no name' do
      @user.name = nil
      expect(@user).to_not be_valid
    end  
  end
end 