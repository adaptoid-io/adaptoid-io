require "rails_helper"

RSpec.describe Github::Author do
  subject(:author) { described_class.new("Ted Johansson", "hello@adaptoid.io", "adaptoid-io") }

  describe "#name" do
    it { expect(author.name).to eq("Ted Johansson") }
  end

  describe "#email" do
    it { expect(author.email).to eq("hello@adaptoid.io") }
  end

  describe "#username" do
    it { expect(author.username).to eq("adaptoid-io") }
  end
end
