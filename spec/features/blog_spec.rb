require 'rails_helper'

RSpec.describe Blog, type: :feature do
  describe "index" do
    before(:each) do
      visit blogs_path
    end

    it "can be visited" do
      expect(page.status_code).to eq(200)
    end

    it "has blogs" do
      blog = FactoryBot.create(:blog_two)
      visit blogs_path
      expect(page).to have_content(/title|body/)
    end
  end
end  