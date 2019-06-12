class Pantry < ActiveRecord::Base 
  has_many :categories_pantries
  has_many :categories, through: :categories_pantries
  has_many :items, through: :categories
  belongs_to :user
end