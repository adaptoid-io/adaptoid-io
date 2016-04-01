require "rails_helper"

RSpec.describe PostsController do
  describe "GET #index" do
    let(:posts) { FactoryGirl.build_list(:post, 5) }

    before do
      allow(Post).to receive(:all) { posts }
    end

    before { get :index }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:index) }
  end

  describe "GET #show" do
    let(:post) { FactoryGirl.build_stubbed(:post) }

    before do
      allow(Post).to receive(:find_by).with(slug: post.slug.to_s) { post }
    end

    before { get :show, id: post.slug }

    it { expect(response).to have_http_status(:success) }
    it { expect(response).to render_template(:show) }
  end
end
