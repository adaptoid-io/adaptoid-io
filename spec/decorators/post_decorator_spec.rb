require "rails_helper"

RSpec.describe PostDecorator do
  let!(:post) { FactoryGirl.create(:post) }

  subject(:decorator) { described_class.new(post) }

  describe "#content" do
    it { expect(decorator.content).to eq("<h1>On The Road</h1>\n") }
  end
end
