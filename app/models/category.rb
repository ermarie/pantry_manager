class Category < ActiveRecord::Base
  has_many :items
  has_many :categories_pantry
  has_many :pantries, through: :categories_pantry
  
  # include Slugify
  # extend Slugify
end