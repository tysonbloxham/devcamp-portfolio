require 'selenium-webdriver'
require 'rails_helper'
require_relative '../classes/baseclass.rb'
require_relative '../classes/blogpage.rb'

describe 'BlogPage UI' do
  before(:each) do
		@browser = BlogPage.new()
		@browser.goto()
  end
  
  after(:each) do
    @browser.close_browser()
  end

  # TODO: Break UI tests out into controller actions for describe blocks

  it 'goes to the blogs page' do
   expect(@browser.blog_identifier.displayed?).to eq(true)
  end

  it 'makes sure users must be signed in to write new blogs' do
    expect(@browser.new_blog_link).to eq(false)
  end

  it 'logs in from blogs page and navigates back to blogs' do
    @browser.login_on_blogs()
    expect(@browser.blog_identifier.displayed?).to eq(true)
    expect(@browser.login_link).to eq(false)
  end

  it 'writes a new blog' do
    @browser.login_on_blogs()
    @browser.new_blog_link.click()
    @browser.write_new_blog()
    expect(@browser.get_title).to eq("A Title")
    @browser.delete_blog_on_show()
    sleep 1
  end

  it 'tries to write a blog without a title' do
    @browser.login_on_blogs()
    @browser.new_blog_link.click()
    @browser.write_blog_body('Something something something')
    @browser.blog_submit()
    expect(@browser.missing_info_error.displayed?).to eq(true)
  end

  it 'tries to write a blog without a body' do
    @browser.login_on_blogs()
    @browser.new_blog_link.click()
    @browser.write_blog_title('Some Kind of Title')
    @browser.blog_submit()
    expect(@browser.missing_info_error.displayed?).to eq(true)
  end

  # currently not working, it opens the page but the page stays blank and the test keeps running until you manually close the window
  xit 'navigates to github' do
    @browser.github_link()
    @browser.switching_tabs()
    expect(@browser.get_title).to include("tysonbloxham")
  end
end