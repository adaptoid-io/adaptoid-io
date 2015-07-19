require 'rails_helper'

describe Github::Webhooks::PushEvent do
  let(:payload) { { ref: 'refs/heads/master', commits: [{ author: 'Yoda', added: ['foo.md'] }, { author: 'Obi-Wan', added: ['bar.md'] }] } }

  describe '.parse' do
    subject(:result) { described_class.parse(payload) }

    context 'with valid payload' do
      it { expect(result.branch).to eq('master') }
      it { expect(result.authors).to eq(%w(Yoda Obi-Wan)) }
      it { expect(result.files.added).to eq(%w(foo.md bar.md)) }
    end

    context 'without a valid ref' do
      before { payload[:ref] = nil }

      it { expect { result }.to raise_error }
    end

    context 'without a valid commit' do
      before { payload[:commits] = nil }

      it { expect { result }.to raise_error }
    end
  end
end
