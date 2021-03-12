pp 'Import packages...'
require 'pry'
require 'yaml'
require 'securerandom'
require 'time'
require 'net/http'
require 'json'

pp 'Import all files...'
pp Dir["#{File.dirname(__FILE__)}/**/*.rb"].sort_by(&:length)
pp Dir["#{File.dirname(__FILE__)}/**/*.rb"].sort_by(&:length).map { |file| require file unless file.include?('initialize') }

pp 'Init system'
CommandLineInterface::Main.new.main()
