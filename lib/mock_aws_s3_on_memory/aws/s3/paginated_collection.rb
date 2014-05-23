module AWS
  class S3
    module PaginatedCollection
      protected
      def _each_item markers, limit, options = {}, &block
        options = list_options(options)
        res = AWS::Core::Response.new
        keys = MockAwsS3OnMemory.buckets[bucket.name].keys.select do |key|
           options[:prefix].nil? || key.to_s.start_with?(options[:prefix])
        end
        res.data = {contents: keys.map {|key| {key: key}}, common_prefixes: []}
        each_member_in_page(res, &block)
        nil
      end
    end
  end
end
