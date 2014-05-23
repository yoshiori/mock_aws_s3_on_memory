require 'aws/s3'

require "mock_aws_s3_on_memory/version"
require "mock_aws_s3_on_memory/aws/s3/s3_object"
require "mock_aws_s3_on_memory/aws/s3/paginated_collection"
require "mock_aws_s3_on_memory/aws/s3/object_collection"

class MockAwsS3OnMemory
  class << self
    def buckets
      @buckets ||= Hash.new {|h, k| h[k] = {} }
    end

    def clear
      buckets.clear
    end
  end
end
