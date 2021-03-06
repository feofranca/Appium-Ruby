require 'appium_lib'
require 'yaml'
require 'pry'

caps = case ENV['DEVICE']
       when 'nexus_5X'
         YAML.load_file(File.join('./features/support/caps', 'nexus_5X.yml'))
       when 'pixel_XL'
         YAML.load_file(File.join('./features/support/caps', 'pixel_XL.yml'))
       end

Dir[File.join(File.dirname(__FILE__), 'page_helper', '*.rb')].sort.each { |file| require_relative file }
World(PageObjects)

Appium::Driver.new(caps, true)
Appium.promote_appium_methods Object
