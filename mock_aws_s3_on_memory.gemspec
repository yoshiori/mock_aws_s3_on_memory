# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mock_aws_s3_on_memory/version'

Gem::Specification.new do |spec|
  spec.name          = "mock_aws_s3_on_memory"
  spec.version       = MockAwsS3OnMemory::VERSION
  spec.authors       = ["Yoshiori SHOJI"]
  spec.email         = ["yoshiori@gmail.com"]
  spec.summary       = %q{simple AWS::S3 mock.  so you can use it in your tests without  use the network.}
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/yoshiori/mock_aws_s3_on_memory"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry-debugger"
  spec.add_development_dependency "webmock"

  spec.add_dependency "aws-sdk"
end
