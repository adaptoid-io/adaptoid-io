require "rails_helper"

RSpec.describe Author do
  subject { FactoryGirl.build(:author) }

  it { is_expected.to have_many(:authorships).inverse_of(:author) }
  it { is_expected.to have_many(:posts).through(:authorships).inverse_of(:authors) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_uniqueness_of(:username) }
end
