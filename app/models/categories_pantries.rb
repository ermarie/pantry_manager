class CategoriesPantry < ActiveRecord::Base
  belongs_to :category
  belongs_to :pantry
end