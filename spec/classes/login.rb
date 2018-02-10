require 'selenium-webdriver'

class Login < BaseClass

  def initialize 
    super
    @register_url = 'localhost:3000/register'
    @login_url = 'localhost:3000/login'
    @new_login = Faker::Internet.email
    @new_password = 'asdfasdf'
    @new_name = Faker::StarWars.character
    @wrong_email = "wrong@wrong.com"
    @wrong_password = "wrongwrongwrong"
  end

  def goto_register()
    setup(@register_url)
  end

  def goto_login()
    setup(@login_url)
  end

  def create_new_user()
    email = find_element_with_wait(xpath: '//*[@id="user_email"]')
    write_things(email, @new_login)

    password = find_element_with_wait(xpath: '//*[@id="user_password"]')
    write_things(password, @new_password)

    password_confirmation = find_element_with_wait(xpath: '//*[@id="user_password_confirmation"]')
    write_things(password_confirmation, @new_password)

    name = find_element_with_wait(xpath: '//*[@id="user_name"]')
    write_things(name, @new_name)
  end

  def wrong_login()
    login(@wrong_email, @wrong_password)
  end

  def submit_button()
    sign_up = find_element_with_wait(xpath: '//*[@id="new_user"]/div/div[4]/div[1]/input')
    sign_up.click()
  end
end