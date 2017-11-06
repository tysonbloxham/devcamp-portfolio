require 'selenium-webdriver'

class BaseClass

  def initialize()
    @driver=Selenium::WebDriver.for :chrome
    @homepage_url = "localhost:3000"
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
    wait.until { 
      element = @driver.find_element(what)
      element if element.displayed?
    }
  end

  def find_visible_element(how, what)
    elems = @driver.find_elements(how, what).select { |e| e.displayed? }
    len = elems.length
    if len == 0
      raise "No matches found."
    elsif len > 1
      raise "Ambiguous match. Found #{len} matches."
    end
    elems.first
  end

  def logout_link()
    @driver.find_element(:link_text,'Logout')
  end

  def blog_identifier()
    find_element_with_wait(xpath: "/html/body/div[2]/div/h1", "time" => 5)
  end

  def close_browser()
    @driver.quit
  end
end