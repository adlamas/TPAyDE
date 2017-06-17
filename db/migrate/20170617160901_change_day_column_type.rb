class ChangeDayColumnType < ActiveRecord::Migration
def up
    change_column :menus, :day, :date
  end

  def down
    change_column :menus, :day, :string
  end

end
