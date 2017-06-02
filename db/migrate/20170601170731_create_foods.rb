class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.integer :quantity
      t.date :date

      t.timestamps null: false
    end
  end
end
