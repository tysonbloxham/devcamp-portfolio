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
  
  def login(email, password)
    login = login_link() 
    login.click
    
    emailfield = find_element_with_wait(xpath: '//*[@id="user_email"]', "time" => 2)
  	write_things(emailfield, email)

  	passwordfield = find_element_with_wait(xpath: '//*[@id="user_password"]')
  	write_things(passwordfield, password)

  	submitbutton = find_element_with_wait(xpath: '//*[@id="new_user"]/div[4]/input')
  	submitbutton.click
  end

  def admin_login()
    login(@admin_email, @admin_password)
  end

  def wrong_login()
    login(@wrong_email, @wrong_password)
  end

  def blogs_link()
    blog = find_element_with_wait(link: 'Blog', "time" => 5)
    blog.click
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