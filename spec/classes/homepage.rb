require 'selenium-webdriver'

class HomePage < BaseClass

	homepage_url = "localhost:3000"
	@admin_email = "admin@test.com"
	@admin_password = "Hansolo"

	def go_to()
	  @driver.navigate.to homepage_url
	end

  def search_bar()
    @driver.find_element(tag_name: 'h1', text: 'Welcome')
  end

  def admin_login()
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    login = wait.until {
      element = @driver.find_element(link: 'Login')
      element if element.displayed?
    }
    login.click
    sleep 2
   #  emailfield = @driver.find_element(xpath: '//*[@id="user_email"]')

    emailfield = wait.until {
      element = @driver.find_element(xpath: '//*[@id="user_email"]')
      element if element.displayed?
    }
  	emailfield.send_keys("admin@test.com")

  	passwordfield = @driver.find_element(xpath: '//*[@id="user_password"]')
  	passwordfield.send_keys("Hansolo")

  	submitbutton = @driver.find_element(xpath: '//*[@id="new_user"]/div[4]/input')
  	submitbutton.click
  end
end