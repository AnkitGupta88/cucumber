require_relative 'phantom_js'

After do |scenario|
  save_screenshot(PhantomJS::screenshot, full: true) if scenario.failed?
end
