require 'selenium-webdriver'

class BaseClass

  def initialize()
    @driver=Selenium::WebDriver.for :chrome
  end

  def setup(url)
    @driver.manage.window.maximize
    @driver.navigate.to url 
  end

  def write_things(element)
    element.send_keys "Hello WebDriver!"
  end

  def find_element_with_wait(element_id, time = 10)
    wait = Selenium::WebDriver::Wait.new(timeout: time) # seconds
    wait.until { @driver.find_element(id: element_id) }
  end

  def login_username()
    return @driver.find_element(:id,'login_login_username')
  end

  def login_password()
    return @driver.find_element(:id,'login_login_password')
  end

  def submit_button()
    return @driver.find_element(:id,'login_submit')
  end

  def logout_link()
    @driver.find_element(:link_text,'Logout')
  end

  def search_bar()
    @driver.find_element(:name, 'q')
  end

  def close_browser()
    @driver.quit
  end
end