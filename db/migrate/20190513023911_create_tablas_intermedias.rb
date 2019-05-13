class CreateTablasIntermedias < ActiveRecord::Migration[5.2]
  def change
    create_table :operaciones_atraccions do |t|
      t.references :users, foreign_key: true 
      t.references :atraccions, foreign_key: true 
      t.references :tickets, foreign_key: true 

      t.timestamps
    end

    create_table :ticket_estados do |t|
      t.references :estados, foreign_key: true 
      t.references :tickets, foreign_key: true 

      t.timestamps
    end
  end
end
