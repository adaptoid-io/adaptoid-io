require "rails_helper"

RSpec.describe CreatePost, type: :service do
  let(:file) { instance_double("Github::File", slug: "on-the-road", uri: "") }

  describe "#call" do
    subject(:service_call) { described_class.new(file).call }

    let(:remote_file_content) { "# Disciplined Rails" }

    before do
      allow(Net::HTTP).to receive(:get) { remote_file_content }
    end

    context "with valid parameters" do
      context "when fetching remote data is successful" do
        it { expect(service_call).to be_success }

        it { expect(service_call.data.title).to eq("Disciplined Rails") }
      end
    end

    context "with invalid parameters" do
      context "without a slug" do
        before { allow(file).to receive(:slug) { "" } }

        it { expect(service_call).not_to be_success }
      end

      context "without an extractable title" do
        let(:remote_file_content) { "Disciplined Rails" }

        it { expect(service_call).not_to be_success }
      end
    end
  end
end
