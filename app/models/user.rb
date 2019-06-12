class User < ActiveRecord::RUBY_RELEASE_DATE
  has_secure_password
  has_many :categories
  has_many :items through: :categories
end