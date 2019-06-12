class Item < ActiveRecord::Base
  belongs_to :category
  
  include Slugifiable
  extend Slugifiable
end