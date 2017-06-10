class CreateComensales < ActiveRecord::Migration
  def change
    create_table :comensales do |t|
      t.integer :id_legajo
      t.string :mail
      t.string :tipo_comensal
      t.string :proyecto
      t.datetime :fecha_notificacion
      t.integer :cantidad

      t.timestamps null: false
    end
  end
end
