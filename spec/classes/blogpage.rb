require 'selenium-webdriver'

class BlogPage < BaseClass
  def initialize
    super
    @blogs_url = "localhost:3000/blogs"
  end

  def goto()
    setup(@blogs_url)
  end

  def new_blog_link()
    find_element_with_wait(xpath: "/html/body/div[2]/div/a", "time" => 15 )
  end

  def write_blog_title(text)
    title = find_element_with_wait(xpath: '//*[@id="blog_title"]', 'time' => 5 )
    write_things( title, text )
  end

  def write_blog_body(text)
    body = find_element_with_wait(xpath: '//*[@id="blog_body"]', 'time' => 3 )
    write_things( body, text )
  end

  def blog_submit()
    submit = find_element_with_wait(xpath: '//*[@id="new_blog"]/div[3]/input', 'time' => 3 )
    submit.click()
  end

  def write_new_blog()
    write_blog_title("A Title")
    write_blog_body("This is a body")
    blog_submit()
  end

  def missing_info_error()
    find_element_with_wait(xpath: '//*[@id="error_explanation"]/ul/li', 'time' => 3 )
  end

  def github_link()
    find_element_with_wait(xpath: "//*[@class='fa fa-github']", 'time' => 3 ).click()
  end

  def login_on_blogs()
    admin_login(false)
    goto()    
  end

  def delete_blog_on_show()
    delete = find_element_with_wait(xpath: '/html/body/div[3]/div/div[1]/a[2]', 'time' => 3 )
    delete.click
    accept_alert()
  end
end