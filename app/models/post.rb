class Post < ApplicationRecord
  belongs_to :author

  # has_many :elements
  has_many :comments
  # has_many :photos
end
