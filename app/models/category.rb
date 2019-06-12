class Category < ActiveRecord::Base
  has_many :items
  has_many :categories_pantries
  has_many :pantries, through: :categories_pantries
end