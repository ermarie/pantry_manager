class User < ActiveRecord::Base 
  has_secure_password
  validates :username, uniqueness: true
  has_one :pantry
  
  include Slugify

end