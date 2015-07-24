require 'rails_helper'

RSpec.describe Authorship do
  it { should belong_to(:author) }
  it { should belong_to(:post) }
end
