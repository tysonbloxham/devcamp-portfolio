require 'rails_helper'
require 'selenium-webdriver'
require_relative '../classes/baseclass.rb'
require_relative '../classes/homepage.rb'

describe 'HomePage' do
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
	
	it 'logs in with incorrect info' do
		@browser.wrong_login()
		expect(@browser.login_link().displayed?).to eq(true)
	end

  it 'navigates to blog page' do
  	@browser.blogs_link()
  	expect(@browser.blog_identifier.displayed?).to eq(true)
  end

  it 'navigates to about me page via nav bar' do
  	@browser.about_me_link()
  	expect(@browser.about_identifier.displayed?).to eq(true)
	end
	
	it 'navigate to about me page using button' do
		@browser.about_me_button()
		sleep 3
		expect(@browser.about_identifier.displayed?).to eq(true)
	end

  it 'navigate to contact page' do
  	@browser.contact_link()
  	expect(@browser.contact_identifier.displayed?).to eq(true)
  end
end
