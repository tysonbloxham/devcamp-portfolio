require 'rails_helper'
require 'selenium-webdriver'
require_relative '../classes/baseclass.rb'
require_relative '../classes/homepage.rb'

describe 'BaseClass' do
  it 'Goes to the homepage' do
  	browser = HomePage.new()
  	browser.setup("localhost:3000")
  	sleep 2
  	expect(browser.search_bar.displayed?).to eq(true)
  	browser.close_browser()
  end

  it 'logs in as an admin' do
  	browser = HomePage.new()
  	browser.admin_login()
  	expect(browser.logout_link.displayed?).to eq(true)
  	browser.close_browser()
  end
end
