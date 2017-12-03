require 'selenium-webdriver'

class HomePage < BaseClass

  def initialize
    super
    @homepage_url = "localhost:3000"
    @admin_email = "admin@test.com"
    @admin_password = "Hansolo"
    @wrong_email = "wrong@wrong.com"
    @wrong_password = "wrongwrongwrong"
  end

	def go_to()
	  @driver.navigate.to homepage_url
  end
  

  def about_me_link()
    about_me = find_element_with_wait(xpath: "//a[@href='/about-me'][text()='About Me'][text()='About Me']", "time" => 5)
    about_me.click    
  end

  def about_me_button()
    about_button = find_element_with_wait(xpath: "//a[@class='btn btn-lg btn-primary'][text()='About Me']", "time" => 5)
    about_button.click
  end

  def contact_link()
    contact = find_element_with_wait(link: 'Contact', "time" => 5)
    contact.click
  end

  def welcome_message()
    find_element_with_wait(xpath: '/html/body/div/div/div/div[2]/h1')    
  end
end