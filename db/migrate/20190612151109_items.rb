class Items < ActiveRecord::Migration
  def up
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.string :variety
    end
  end
  
  def down
    drop_table :items
  end
end
