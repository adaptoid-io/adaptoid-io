require "rails_helper"

RSpec.describe Author do
  it { should have_many(:posts).through(:authorships) }

  it { should validate_presence_of(:name) }
end
