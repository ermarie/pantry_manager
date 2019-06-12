class Item < ActiveRecord::Base
  belongs_to :category
  
  # include Slugify
  # extend Slugify
end