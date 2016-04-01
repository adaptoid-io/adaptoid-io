class Post < ActiveRecord::Base
  has_many :authorships, inverse_of: :post
  has_many :authors, through: :authorships, inverse_of: :posts

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true
end
