class AddColumnPausedToAtraccion < ActiveRecord::Migration[5.2]
  def change
    add_column :atraccions, :pause, :boolean
  end
end
