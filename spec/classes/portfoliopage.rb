require 'selenium-webdriver'

class PortfolioPage < BaseClass
  def initialize
    super
    @portfolios_url = 'localhost:3000/portfolios'    
  end

  def goto()
    @driver.navigate.to @portfolios_url
  end
  
end