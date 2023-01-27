class Tag < ApplicationRecord
  has_many :posts, through: :taggings, source: :taggable, source_type: 'Post'
  has_many :photos, through: :taggings, source: :taggable, source_type: 'Photo'
end
