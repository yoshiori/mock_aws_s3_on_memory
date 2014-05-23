require 'spec_helper'

describe AWS::S3::S3Object do
  let(:s3) do
    AWS::S3.new
  end

  let(:bucket) do
    s3.buckets['my-bucket']
  end

  let(:obj) do
    bucket.objects['key']
  end

  describe "#write and #read" do
    it "store value" do
      obj.write("foo")
      expect(obj.read).to eq "foo"
    end
  end

  describe "#exists?" do
    context "exist value" do
      before do
        obj.write("foo")
      end

      it { expect(obj).to be_exist}
    end

    context "not exist value" do
      it { expect(obj).to_not be_exist }
    end
  end

  describe "#delete" do
    before do
      obj.write("foo")
    end

    it "delete value" do
      expect {
        obj.delete
      }.to change { obj.exists? }.from(true).to(false)
    end
  end

  describe "#copy_from" do
    before do
      obj.write("foo")
    end

    it "copy value" do
      expect {
        bucket.objects["bar"].copy_from(obj)
      }.to change { bucket.objects["bar"].exists? }.from(false).to(true)
    end
  end

  describe "#copy_to" do
    before do
      obj.write("foo")
    end

    it "copy value" do
      expect {
        obj.copy_to("bar")
      }.to change { bucket.objects["bar"].exists? }.from(false).to(true)
    end
  end

  describe "#move_to" do
    before do
      obj.write("foo")
    end

    it "move value" do
      expect {
        obj.move_to("bar")
      }.to change { bucket.objects["bar"].exists? }.from(false).to(true)
      expect(obj).to_not be_exist
    end
  end
end
