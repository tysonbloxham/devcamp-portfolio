require 'selenium-webdriver'

class Login < BaseClass

  def initialize 
    super
    @register_url = 'localhost:3000/register'
    @login_url = 'localhost:3000/login'
    @new_login = Faker::Internet.email
    @new_password = 'asdfasdf'
    @new_name = Faker::StarWars.character
  end

  def goto_register()
    setup(@register_url)
  end

  def goto_login()
    setup(@register_url)
  end
end