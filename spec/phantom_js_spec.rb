require_relative 'spec_helper'
require_relative '../features/support/phantom_js'

describe PhantomJS do
  describe '::settings' do
    it 'must return the list of settings as an hash' do
      PhantomJS::settings.must_be_instance_of Hash
    end

    it 'must invoke the proxy method' do
      mock(PhantomJS).proxy { {} }
      PhantomJS::settings
    end
  end

  describe '::proxy' do
    it 'must return an empty hash if url is unset' do
      PhantomJS::proxy(nil).must_be_empty
    end

    it 'must return a properly valued hash if url is set' do
      url = 'my_brute_proxy.com:8080'
      PhantomJS::proxy(url).must_equal({ proxy: url })
    end
  end

  describe '::options' do
    it 'must invoke the settings method' do
      mock(PhantomJS).settings { [] }
      PhantomJS::options
    end

    it 'must return the options as an array of strings' do
      options = PhantomJS::options
      options.must_be_instance_of Array
      assert options.all? { |opt| opt.instance_of?(String) }
    end
  end
end
