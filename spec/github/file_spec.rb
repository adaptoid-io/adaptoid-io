require 'rails_helper'

describe Github::File do
  subject(:file) { described_class.new('foo.md') }

  describe '#name' do
    it { expect(file.name).to eq('foo.md') }
  end

  describe '#slug' do
    it { expect(file.slug).to eq('foo') }
  end
end
