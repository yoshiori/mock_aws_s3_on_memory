# MockAwsS3OnMemory
This is a simple gem for mocking out the AWS::S3 library like a [mock-aws-s3](https://github.com/jkrall/mock-aws-s3).

## Installation

Add this line to your application's Gemfile:

    gem 'mock_aws_s3_on_memory'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mock_aws_s3_on_memory

## Usage

### RSpec

Add the following code to `spec/spec_helper`:

```ruby
require 'mock_aws_s3_on_memory'

RSpec.configure do |config|
  config.before(:each) do
    MockAwsS3OnMemory.clear
  end
end
```

```ruby
[1] pry(main)> require 'mock_aws_s3_on_memory'
=> true
[2] pry(main)> obj = AWS::S3.new.buckets['my-bucket'].objects['key']
=> <AWS::S3::S3Object:my-bucket/key>
[3] pry(main)> obj.exists?
=> false
[4] pry(main)> obj.write("foo")
=> #<StringIO:0x007f98f72eab48>
[5] pry(main)> obj.exists?
=> true
[6] pry(main)> obj.delete
=> #<StringIO:0x007f98f72eab48>
[7] pry(main)> obj.exists?
=> false
```
more example this library's spec file

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mock_aws_s3_on_memory/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
