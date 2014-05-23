module AWS
  class S3
    class ObjectCollection
      def delete *objects
        objects.flatten.each do |obj|
          obj.delete
        end
      end
    end
  end
end
