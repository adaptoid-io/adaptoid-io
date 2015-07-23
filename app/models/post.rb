class Post < ActiveRecord::Base
  has_many :authorships
  has_many :authors, through: :authorships

  validates_presence_of :slug
end
