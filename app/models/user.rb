class User < ActiveRecord::Base 
  has_secure_password
  validates :username, uniqueness: true
  belongs_to :pantry
  
  include Slugify

end