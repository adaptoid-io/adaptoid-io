require "rails_helper"

RSpec.describe Author do
  it { is_expected.to have_many(:authorships).inverse_of(:author) }
  it { is_expected.to have_many(:posts).through(:authorships).inverse_of(:authors) }

  it { is_expected.to validate_presence_of(:name) }
end
