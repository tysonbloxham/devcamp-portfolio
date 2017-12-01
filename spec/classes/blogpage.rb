require 'selenium-webdriver'

class BlogPage < BaseClass
  def initialize
    super
    @blogs_url = "localhost:3000/blogs"
  end

  def goto()
    @driver.navigate.to(@blogs_url)
  end

  def new_blog_link()
    find_element_with_wait(xpath: "/html/body/div[2]/div/a", "time" => 15 )
  end
end