class AddCoodinatesToAtraccions < ActiveRecord::Migration[5.2]
  def change
    add_column :atraccions, :latitude, :decimal
    add_column :atraccions, :longitude, :decimal
  end
end
