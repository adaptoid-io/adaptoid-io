require "rails_helper"

RSpec.describe BaseDecorator do
  let(:model) { instance_double("Model") }

  subject(:decorator) { described_class.new(model) }

  describe "#model" do
    it { expect(decorator.model).to eq(model) }
  end
end
