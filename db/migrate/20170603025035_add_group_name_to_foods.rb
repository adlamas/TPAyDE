class AddGroupNameToFoods < ActiveRecord::Migration
  def change
    add_column :foods, :group_name, :string
  end
end
