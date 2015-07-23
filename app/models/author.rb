class Author < ActiveRecord::Base
  has_many :authorships
  has_many :posts, through: :authorships

  validates :name, presence: true
end
