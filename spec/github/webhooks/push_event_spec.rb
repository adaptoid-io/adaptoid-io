require "rails_helper"

RSpec.describe Github::Webhooks::PushEvent do
  let(:payload) do
    {
      ref: "refs/heads/master",
      commits: [
        { author: "Yoda", added: %w(foo.md bar.md), modified: [] },
        { author: "Obi-Wan", added: %w(baz.md), modified: %w(foo.md) }
      ]
    }
  end

  describe ".parse" do
    subject(:result) { described_class.parse(payload) }

    context "with valid payload" do
      it { expect(result.branch).to eq("master") }
      it { expect(result.authors).to eq(%w(Yoda Obi-Wan)) }
      it { expect(result.files.added.map(&:name)).to eq(%w(foo.md bar.md baz.md)) }
      it { expect(result.files.added.map(&:slug)).to eq(%w(foo bar baz)) }
      it { expect(result.files.modified.map(&:name)).to eq(%w(foo.md)) }
      it { expect(result.files.modified.map(&:slug)).to eq(%w(foo)) }
    end

    context "without a valid ref" do
      before { payload[:ref] = nil }

      it { expect { result }.to raise_error("Failed to parse reference.") }
    end

    context "without a valid commit" do
      before { payload[:commits] = nil }

      it { expect { result }.to raise_error("Failed to parse commits.") }
    end
  end
end
