class Author < ActiveRecord::Base
  has_many :authorships, inverse_of: :author
  has_many :posts, through: :authorships, inverse_of: :authors

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
end
