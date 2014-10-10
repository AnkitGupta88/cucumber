require 'database_cleaner'
require 'database_cleaner/cucumber'
require_relative '../../config/database'

DatabaseCleaner.strategy = :truncation

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end
