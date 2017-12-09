require 'selenium-webdriver'

class PortfolioPage < BaseClass
  def initialize
    super
    @portfolios_url = 'localhost:3000/portfolios'    
  end

  def goto()
    @driver.navigate.to @portfolios_url
  end
  
  def open_navbar()
    portfolio_identifier.click()   
  end
  
  def login_on_portfolio()
    open_navbar()
    admin_login()
    goto()
  end

  def blog_button()
    find_element_with_wait(xpath: '/html/body/section/div/p[2]/a[2]').click()
  end

  def masthead_identifier()
    find_element_with_wait(xpath: "/html/body/section/div/h1")
  end
end