require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/blogpage.rb'

describe 'Blogs Page' do
  before(:each) do
		@browser = BlogPage.new()
		@browser.setup("localhost:3000/blogs")
  end
  
  after(:each) do
    @browser.close_browser()
  end

  it 'goes to the blogs page' do
   sleep 2
   expect(@browser.blog_identifier.displayed?).to eq(true)
  end

  it 'makes sure users must be signed in to write new blogs' do
    expect(@browser.new_blog_link()).to eq(false)
  end

  it 'logins in from blogs page and navigate back to blogs' do
    @browser.login_on_blogs()
    expect(@browser.blog_identifier.displayed?).to eq(true)
    expect(@browser.login_link).to eq(false)
  end

  it 'writes a new blog special' do
    @browser.login_on_blogs()
    @browser.new_blog_link.click()
    @browser.write_new_blog()
    expect(@browser.get_title()).to eq("A Title")
    @browser.delete_blog_on_show()
  end
end