require "rails_helper"

RSpec.describe PostDecorator do
  let!(:post) { FactoryGirl.build_stubbed(:post) }

  subject(:decorator) { described_class.new(post) }

  describe "#content" do
    it { expect(decorator.content).to eq("<h1>On The Road</h1>\n") }
  end

  describe "#publication_date" do
    it { expect(decorator.publication_date).to eq("5 September") }
  end

  describe "#authors" do
    before do
      allow(decorator.model.authors).to receive(:pluck).with(:name) { authors }
    end

    context "with a single author" do
      let(:authors) { ["Ted Johansson"] }

      it { expect(decorator.authors).to eq("Ted Johansson") }
    end

    context "with several authors" do
      let(:authors) { ["Jaryl Sim", "Ted Johansson", "Matthew Yeow"] }

      it { expect(decorator.authors).to eq("Jaryl Sim, Ted Johansson, and Matthew Yeow") }
    end
  end
end
