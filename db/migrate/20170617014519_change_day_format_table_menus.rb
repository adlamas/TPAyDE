class ChangeDayFormatTableMenus < ActiveRecord::Migration
  
  def up
    change_column :menus, :day, :datetime
  end

  def down
    change_column :menus, :day, :string
  end

end
