require 'selenium-webdriver'

class PortfolioPage < BaseClass
  def initialize
    super
    @portfolios_url = 'localhost:3000/portfolios'    
  end

  def goto()
    setup(@portfolios_url)
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
  
  def about_me_button()
    find_element_with_wait(xpath: '/html/body/section/div/p[2]/a[1]').click()
  end
  
  def all_portfolios_link()
    find_element_with_wait(xpath: '/html/body/footer/div/p/a[1]', 'time' => 5 ).click()
  end

  def first_portfolio_show()
    find_element_with_wait(xpath: '/html/body/div[2]/div/div/div[1]/p/span/a', 'time' => 5 )
  end
  
  def show_identifier()
    find_element_with_wait(xpath: '/html/body/div[2]/div/div[1]/img')
  end

  def masthead_identifier()
    find_element_with_wait(xpath: "/html/body/section/div/h1")
  end
end