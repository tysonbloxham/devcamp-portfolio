require 'selenium-webdriver'

class BaseClass

  def initialize()
    @driver=Selenium::WebDriver.for :chrome
    @admin_email = "admin@test.com"
    @admin_password = "Hansolo"
  end

  def setup(url)
    @driver.manage.window.maximize
    @driver.navigate.to url 
  end

  def write_things(element, writing)
    element.send_keys writing
  end

  def find_element_with_wait(what, time = 10)
    wait = Selenium::WebDriver::Wait.new(timeout: time) # seconds
    begin
      wait.until {
        element = @driver.find_element(what)
        element if element.displayed?
      }
    rescue Selenium::WebDriver::Error::TimeOutError
      puts "Couldn't find #{what}"
      return false
    end
  end

  def accept_alert()
    @driver.switch_to.alert.accept rescue Selenium::WebDriver::Error::NoAlertOpenError
  end

  def login(email, password, using_link = false)
    login_link.click() if using_link
    
    emailfield = find_element_with_wait(xpath: '//*[@id="user_email"]', "time" => 2)
  	write_things(emailfield, email)

  	passwordfield = find_element_with_wait(xpath: '//*[@id="user_password"]')
    write_things(passwordfield, password)
    
  	submitbutton = find_element_with_wait(xpath: '//*[@id="new_user"]/div[4]/input')
  	submitbutton.click
  end

  def admin_login(using_link = false)
    login(@admin_email, @admin_password, using_link)
  end

  def logout_link()
    find_element_with_wait(link: 'Logout', "time" => 5)
  end

  def login_link()
    find_element_with_wait(link: 'Login', "time" => 5)
  end

  def blogs_link()
    blog = find_element_with_wait(link: 'Blog', "time" => 5)
    blog.click
  end

  def switching_tabs()
    @driver.switch_to.window( @driver.window_handles.last )
  end

  def blog_identifier()
    find_element_with_wait(xpath: "/html/body/div[2]/div/h1", "time" => 5)
  end

  def portfolio_identifier()
    find_element_with_wait(xpath: "/html/body/nav/div/button/span", "time" => 5)
  end

  def about_identifier()
    find_element_with_wait(xpath: "/html/body/div/div/div/div[2]/h1", "time" => 5)
  end

  def contact_identifier()
    find_element_with_wait(xpath: "//h1[text()='Contact Me']", "time" => 5)
    # "/html/body/div/div/div/div[2]/div/div[1]/p[2]/a", "time" => 5)    
  end

  def get_title()
    @driver.title
  end

  def close_browser()
    @driver.quit
  end
end