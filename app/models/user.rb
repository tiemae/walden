class User < ApplicationRecord
  has_many :comments
  has_many :posts
  belongs_to :tag
end
