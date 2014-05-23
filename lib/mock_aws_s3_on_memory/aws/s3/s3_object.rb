module AWS
  class S3
    class S3Object
      def initialize(bucket, key, opts = {})
        super
        @key = key
        @bucket = bucket
      end

      def write_with_put_object options
        buckets[bucket_name][@key] = options[:data]
      end
      alias_method :write_with_multipart, :write_with_put_object

      def get_object options, &read_block
        data = {data: buckets[bucket_name][@key].read }
        if block_given?
          yield data
        else
          data
        end
      end

      def copy_from source, options = {}
          buckets[bucket_name][@key] = buckets[bucket_name][source.key]
      end

      def delete options = {}
        buckets[bucket_name].delete @key
      end

      def exists?
        buckets[bucket_name].has_key? @key
      end

      def bucket_name
        bucket.name
      end

      def buckets
        MockAwsS3OnMemory.buckets
      end
    end
  end
end
