require 'selenium-webdriver'

class BlogPage < BaseClass
  def initialize
    super
    @blogs_url = "localhost:3000/blogs"
  end

  def goto()
    @driver.navigate.to(@blogs_url)
  end
end