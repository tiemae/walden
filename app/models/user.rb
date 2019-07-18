class User < ApplicationRecord
  has_many :comments
  has_many :replies
  has_many :posts
  belongs_to :tag

  has_secure_password
  validates :email, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def tag_name
    tag.name
  end

  def tag_picture
    tag.image_url
  end
    
end
