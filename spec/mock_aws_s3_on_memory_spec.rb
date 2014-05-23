require 'spec_helper'

describe MockAwsS3OnMemory do
  it 'has a version number' do
    expect(MockAwsS3OnMemory::VERSION).not_to be nil
  end

  describe ".buckets" do
    it 'returns hash' do
      expect(MockAwsS3OnMemory.buckets).to be_a Hash
    end

    it 'returns same instance' do
      expect(MockAwsS3OnMemory.buckets).to be MockAwsS3OnMemory.buckets
    end
  end

  describe ".clear" do
    before do
      MockAwsS3OnMemory.buckets[:hoge] = :foo
    end

    it 'empty buckets' do
      expect {
        MockAwsS3OnMemory.clear
      }.to change { MockAwsS3OnMemory.buckets.size }.from(1).to(0)
    end
  end
end
