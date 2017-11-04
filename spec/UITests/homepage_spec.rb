require 'rails_helper'
require 'selenium-webdriver'
require_relative '../classes/baseclass.rb'

describe 'BaseClass' do
  it 'Goes to Google' do
    browser = BaseClass.new("http://google.com")
    ele = browser.find_element_with_wait("lst-ib", 5)
    browser.write_things(ele)
    sleep 5
    expect(browser.search_bar.displayed?).to eq(true)
  end
end
