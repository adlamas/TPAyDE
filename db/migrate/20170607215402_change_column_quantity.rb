class ChangeColumnQuantity < ActiveRecord::Migration
  
  def self.up
  	rename_column :foods, :quantity, :id_user
  end

  def self.down
  end

end
