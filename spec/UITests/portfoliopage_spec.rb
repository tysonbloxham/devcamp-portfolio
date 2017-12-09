require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/portfoliopage.rb'

describe 'Portfolio Page' do
  before(:each) do
    @browser = PortfolioPage.new
    @browser.setup('localhost:3000/portfolios')
  end
  
  after(:each) do
    @browser.close_browser()
  end

  it 'goes to portfolio page' do
    expect(@browser.portfolio_identifier.displayed?).to eq(true)
  end
end