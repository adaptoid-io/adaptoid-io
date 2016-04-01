require "rails_helper"

RSpec.describe Post do
  it { is_expected.to have_many(:authorships).inverse_of(:post) }
  it { is_expected.to have_many(:authors).through(:authorships).inverse_of(:posts) }

  it { is_expected.to validate_presence_of(:slug) }
end
