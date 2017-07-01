class AddInvitadoToComensales < ActiveRecord::Migration
  def change
    add_column :comensales, :invitados, :integer
  end
end
