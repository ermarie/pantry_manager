class Pantries < ActiveRecord::Migration
  def up
    create_table :pantries do |t|
      t.string :name
      t.string :user_id
    end
  end
  
  def down
    drop_table :pantries
  end
end
