require 'rails_helper'

describe CreatePost, type: :service do
  let(:file) { double('file', slug: 'on-the-road', uri: '') }

  describe '#call' do
    subject(:service_call) { described_class.new(file).call }

    before { allow(Net::HTTP).to receive(:get) { 'Hello world!' } }

    context 'with valid parameters' do
      context 'when fetching remote data is successful' do
        it { expect(service_call).to be_success }
      end
    end

    context 'with invalid parameters' do
      before { allow(file).to receive(:slug) { '' } }

      it { expect(service_call).not_to be_success }
    end
  end
end
