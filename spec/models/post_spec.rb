require 'rails_helper'

RSpec.describe Post do
  it { should have_many(:authors).through(:authorships) }
end
