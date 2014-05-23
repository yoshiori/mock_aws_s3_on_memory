$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'mock_aws_s3_on_memory'

# check do not use http request 
require 'webmock/rspec'

RSpec.configure do |config|
  config.before(:each) do
    MockAwsS3OnMemory.clear
  end
end
