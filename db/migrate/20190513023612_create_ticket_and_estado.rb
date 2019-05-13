class CreateTicketAndEstado < ActiveRecord::Migration[5.2]
  def change
    create_table :estados do |t|
      t.string :descripcion_est
    end
    
    create_table :tickets do |t|

      t.timestamps
    end


  end
end
