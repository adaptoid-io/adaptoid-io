class Post < ActiveRecord::Base
  has_many :authorships
  has_many :authors, through: :authorships

  validates :slug, presence: true
end
