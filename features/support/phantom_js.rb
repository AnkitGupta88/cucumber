require 'yaml'

module PhantomJS
  extend self

  @settings_file = File.join(File.dirname(__FILE__), '..', '..', 'config', 'phantom_js.yml')
  @logger = File.join(File.dirname(__FILE__), '..', '..', 'log', 'phantomjs.log')

  def logger
    File.new(@logger, 'w')
  end

  def settings
    YAML.load_file(@settings_file).tap do |coll|
      coll.merge!(proxy)
    end
  end

  def proxy(url = ENV['HTTP_PROXY'])
    url ? { proxy: url } : {}
  end

  def options
    settings.each_with_object([]) do |(key, val), coll|
      coll << "--#{key}=#{val}"
    end
  end
end
