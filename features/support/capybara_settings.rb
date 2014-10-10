require 'capybara/cucumber'
require 'capybara/poltergeist'
require_relative '../../lib/phantom_js'

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, 
                                    js_errors: false,
                                    phantomjs_logger: PhantomJS::logger,
                                    phantomjs_options: PhantomJS::options,
                                    window_size: [1280, 1024])
end

Capybara.default_driver    = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.default_selector  = :css
