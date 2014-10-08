require 'rspec/expectations'
require 'capybara/cucumber'
require 'capybara/poltergeist'

HTTP_PROXY = ENV.fetch('HTTP_PROXY') { false }

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, 
                                    js_errors: false,
                                    phantomjs_options: ['--web-security=false'].concat(PhantomJS::proxy_options),
                                    window_size: [1280, 1024])
end

Capybara.default_driver    = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.default_selector  = :css

World(RSpec::Matchers)

module PhantomJS
  def self.proxy_options
    options = HTTP_PROXY ? "--proxy=#{HTTP_PROXY}" : nil
    Array(options)
  end
end
