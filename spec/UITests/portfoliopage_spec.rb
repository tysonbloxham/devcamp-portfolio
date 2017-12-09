require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/portfoliopage.rb'

describe 'Portfolio Page' do
  it 'goes to portfolio page current' do
    @browser = PortfolioPage.new
    @browser.setup('localhost:3000/portfolios')
    expect(@browser.portfolio_identifier.displayed?).to eq(true)
    @browser.close_browser()
  end
end
