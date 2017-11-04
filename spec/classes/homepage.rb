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
  	login = @driver.find_element(link: 'Login')
  	login.click
  	sleep 2
  	emailfield = @driver.find_element(tag_name: 'input', type: 'email')
  	sleep 2
  	emailfield.send_keys(@admin_email)
  	passwordfield = @driver.find_element(tag_name: 'input', type: 'password')
  	passwordfield.send_keys(@admin_password)
  	submitbutton = @driver.find_element(tag_name: 'input', type: 'submit')
  	submitbutton.click
  end
end