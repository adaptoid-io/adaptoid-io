require "rails_helper"

RSpec.describe Authorship do
  it { is_expected.to belong_to(:author).inverse_of(:authorships) }
  it { is_expected.to belong_to(:post).inverse_of(:authorships) }

  it { is_expected.to validate_presence_of(:author) }
  it { is_expected.to validate_presence_of(:post) }
end
