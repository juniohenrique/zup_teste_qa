# frozen_string_literal: true

require 'capybara'
require 'capybara/cucumber'
require 'byebug'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require_relative 'helper.rb'
require_relative 'page_helper.rb'

World(Pages)
World(Helper)

ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE']
DEVICE = ENV['DEVICE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yml")

## register driver according with browser chosen
Capybara.register_driver :selenium do |app|
  if DEVICE.eql?('chrome_desktop')
    option = ::Selenium::WebDriver::Chrome::Options.new(args: ['--headless', '--disable-gpu', '--window-size=1600,1024'])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: option)

  elsif DEVICE.eql?('chrome_desktop_no_headless')
    option = ::Selenium::WebDriver::Chrome::Options.new(args: ['--disable-infobars', 'window-size=1600,1024'])
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: option)
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG['url_default']
  config.default_max_wait_time = 30
end