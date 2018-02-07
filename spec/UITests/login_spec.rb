require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/login.rb'

describe 'Login' do
  before(:each) do
    @browser = Login.new()
    @browser.goto_login()
  end

  after(:each) do
    @browser.close_browser()
  end

  it 'Creates a new user' do
    @browser.create_new_user()
    @browser.submit_button()
    expect(@browser.logout_link.displayed?).to eq(true)
  end

  it 'logs in as an admin' do
    @browser.admin_login()
    expect(@browser.logout_link.displayed?).to eq(true)
	end
	
  it 'logs in with incorrect info' do
    @browser.wrong_login()
		expect(@browser.login_link.displayed?).to eq(true)
	end
end