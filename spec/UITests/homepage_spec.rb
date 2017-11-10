require 'rails_helper'
require 'selenium-webdriver'
require_relative '../classes/baseclass.rb'
require_relative '../classes/homepage.rb'

describe 'BaseClass' do
	before(:each) do
		@browser = HomePage.new()
		@browser.setup("localhost:3000")
	end

	after(:each) do
		@browser.close_browser()
	end

  it 'Goes to the homepage' do
  	sleep 2
  	expect(@browser.welcome_message.displayed?).to eq(true)
  end

  it 'logs in as an admin' do
  	@browser.admin_login()
  	expect(@browser.logout_link.displayed?).to eq(true)
  end

  it 'navigates to blog page' do
  	@browser.blogs_link()
  	expect(@browser.blog_identifier.displayed?).to eq(true)
  end
end
