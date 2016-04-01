class Author < ActiveRecord::Base
  has_many :authorships, inverse_of: :author
  has_many :posts, through: :authorships, inverse_of: :authors

  validates :name, presence: true
end
