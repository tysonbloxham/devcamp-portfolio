require 'rails_helper'

RSpec.describe Blog, type: :model do
  before(:each) do
    @blog = FactoryBot.create(:blog)
  end

  describe "creation" do
    it "can be created" do
      expect(@blog).to be_valid
    end
  end

  describe "validation" do
    it "creates a blog with no title" do
      @blog.title = nil
      expect(@blog).to_not be_valid  
    end

    it "creates a blog with no body" do
      @blog.body = nil
      expect(@blog).to_not be_valid
    end
  end
end
