require 'rspec/expectations'
require_relative 'capybara_settings'

HOST = ENV.fetch('HOST') { 'http://www.gucci.dev' }
World(RSpec::Matchers)
