class Authorship < ActiveRecord::Base
  belongs_to :author, inverse_of: :authorships
  belongs_to :post, inverse_of: :authorships

  validates :author, presence: true
  validates :post, presence: true
end
