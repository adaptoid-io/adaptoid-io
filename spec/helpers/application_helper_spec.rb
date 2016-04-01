require "rails_helper"

RSpec.describe ApplicationHelper do
  describe "#slugged_post_path" do
    let(:post) { FactoryGirl.build_stubbed(:post) }

    it { expect(slugged_post_path(post)).to eq("/posts/#{post.slug}") }
  end

  describe "#slugged_post_url" do
    let(:post) { FactoryGirl.build_stubbed(:post) }

    it { expect(slugged_post_url(post)).to eq("#{@request.protocol}#{@request.host}/posts/#{post.slug}") }
  end
end
