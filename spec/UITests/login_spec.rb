require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/login.rb'

describe 'Login' do
  before(:each) do
    @browser = Login.new()
    @browser.goto_register()
  end

  after(:each) do
    @browser.close_browser()
  end
end