require "rails_helper"

RSpec.describe Github::File do
  subject(:file) { described_class.new("foo.md") }

  describe "#name" do
    it { expect(file.name).to eq("foo.md") }
  end

  describe "#slug" do
    it { expect(file.slug).to eq("foo") }
  end

  describe "#uri" do
    it { expect(file.uri.to_s).to eq("#{ENV['POSTS_URL']}/master/foo.md") }
  end
end
