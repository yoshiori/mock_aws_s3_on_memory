require 'spec_helper'

describe AWS::S3::ObjectCollection do
  let(:s3) do
    AWS::S3.new
  end

  let(:bucket) do
    s3.buckets['my-bucket']
  end

  let(:objects) do
    bucket.objects
  end

  describe "#with_prefix" do
    let(:count) do
      12
    end

    context "single prefix" do
      before do
        count.times do |i|
          objects["foo_#{i}"].write("foo")
        end
        objects["bar_1"].write("bar")
      end

      it "gets values" do
        expect(objects.with_prefix("foo_").count).to be count
      end
    end

    context "chain prefix" do
      before do
        count.times do |i|
          objects["foo_#{i}"].write("foo")
        end
        objects["bar_1"].write("bar")
      end

      it "gets values" do
        expect(objects.with_prefix("foo_").with_prefix('1', :append).count).to be 3
      end
    end
  end

  describe "#delete_all" do
    let(:count) do
      12
    end

    before do
      count.times do |i|
        objects["foo_#{i}"].write("foo")
      end
    end

    it "deletes values" do
      expect {
        objects.delete_all
      }.to change { objects.count }.from(count).to(0)
    end
  end
end
