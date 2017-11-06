require 'selenium-webdriver'

class HomePage < BaseClass

	def go_to()
	  @driver.navigate.to homepage_url
	end

  def search_bar()
    @driver.find_element(tag_name: 'h1', text: 'Welcome')
  end

  def admin_login()
    setup(@homepage_url)
    login = find_element_with_wait(link: 'Login', "time" => 5)
    login.click
    
    emailfield = find_element_with_wait(xpath: '//*[@id="user_email"]', "time" => 2)
  	write_things(emailfield, @admin_email)

  	passwordfield = find_element_with_wait(xpath: '//*[@id="user_password"]')
  	write_things(passwordfield, @admin_password)

  	submitbutton = find_element_with_wait(xpath: '//*[@id="new_user"]/div[4]/input')
  	submitbutton.click
  end

  def blogs_link()
    setup(@homepage_url)
    blog = find_element_with_wait(link: 'Blog', "time" => 5)
    blog.click
  end

  def welcome_message()
    find_element_with_wait(xpath: '/html/body/div/div/div/div[2]/h1')    
  end
end