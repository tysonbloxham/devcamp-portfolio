require 'rails_helper'

RSpec.describe Blog, type: :model do
  describe "creation" do
    before do
      @blog = FactoryBot.create(:blog)
    end

    it "can be created" do
      expect(@blog).to be_valid
    end
    
  end
end
