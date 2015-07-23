require 'rails_helper'

describe PostDecorator do
  let!(:post) { create(:post) }

  subject(:decorator) { described_class.new(post) }

  describe '#content' do
    it { expect(decorator.content).to eq("<h1>On The Road</h1>\n") }
  end
end
