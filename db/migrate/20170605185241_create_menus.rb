class CreateMenus < ActiveRecord::Migration
  def change
    create_table :menus do |t|
      t.string :dish
      t.string :day

      t.timestamps null: false
    end
  end
end
