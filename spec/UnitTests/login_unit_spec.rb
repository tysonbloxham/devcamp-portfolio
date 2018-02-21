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
end 