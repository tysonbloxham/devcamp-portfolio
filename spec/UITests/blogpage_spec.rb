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
end