require 'rails_helper'

describe Github::Files do
  subject(:files) { described_class.new(%w(foo.md bar.md), %w(baz.md), nil) }

  describe '#added' do
    it { expect(files.added).to eq(%w(foo.md bar.md)) }
  end

  describe '#removed' do
    it { expect(files.removed).to eq(%w(baz.md)) }
  end

  describe '#modified' do
    it { expect(files.modified).to eq([]) }
  end
end
