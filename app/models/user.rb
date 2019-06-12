class User < ActiveRecord::Base 
  has_secure_password
  belongs_to :pantry
  
  include Slugifiable
  extend Slugifiable
end