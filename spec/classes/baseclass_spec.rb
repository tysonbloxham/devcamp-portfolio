require 'rails_helper'
require 'selenium-webdriver'

class BaseClass
	def setup
		@driver = Selenium::WebDriver.for :safari
		@driver.navigate.to "http://google.com"

		element = @driver.find_element(name: 'q')
		element.send_keys "Hello WebDriver!"

		puts @driver.title

		@driver.quit
	end
end

describe 'BaseClass' do
	it 'Goes to Google' do
		BaseClass.setup
    expect(page.status_code).to eq(200)
	end
end


		# element = @driver.find_element(name: 'q')
		# element.send_keys "Hello WebDriver!"
		# element.submit
