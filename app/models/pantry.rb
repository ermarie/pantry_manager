class Pantry < ActiveRecord::Base 
  has_many :categories_pantry
  has_many :categories, through: :categories_pantry
  has_many :items, through: :categories
  belongs_to :user
  
  # include Slugify
  # extend Slugify
end