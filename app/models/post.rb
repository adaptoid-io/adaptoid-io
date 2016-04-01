class Post < ActiveRecord::Base
  has_many :authorships, inverse_of: :post
  has_many :authors, through: :authorships, inverse_of: :posts

  validates :slug, presence: true
end
