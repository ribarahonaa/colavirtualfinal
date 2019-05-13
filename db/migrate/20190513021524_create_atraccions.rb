class CreateAtraccions < ActiveRecord::Migration[5.2]
  def change
    create_table :atraccions do |t|
      t.string :nombre_atc
      t.text :descripcion_atc
      t.string :imagen_atc
      t.integer :capacidad_atc

      t.timestamps
    end
  end
end
