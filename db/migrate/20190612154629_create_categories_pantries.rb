class CreateCategoriesPantries < ActiveRecord::Migration
  def up
    create_table :categories_pantries do |t|
      t.integer :category_id
      t.integer :pantry_id
    end
  end
  
  def down
    drop_table :categories_pantries
  end
end
