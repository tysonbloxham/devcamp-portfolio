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

  describe "new" do
    let(:user) { FactoryBot.create(:user) }
    let(:admin) { FactoryBot.create(:admin) }

    before(:each) do
      visit blogs_path
    end

    it "can't create blogs without logging in" do
      visit new_blog_path
      expect(page).to have_current_path(root_path)
    end

    it "can't create blogs as a non-admin user" do
      login_as(user, :scope => :user)
      visit new_blog_path
      expect(page).to have_current_path(root_path)
    end

    it "can log in as admin and create blogs" do
      login_as(admin, :scope => :user)
      visit new_blog_path
      expect(page).to have_current_path(new_blog_path)
    end
  end
end  