class CreateItems < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.string :variety
      t.string :flavor
      t.integer :category_id
    end
  end
  
  def down
    drop_table :items
  end
end
