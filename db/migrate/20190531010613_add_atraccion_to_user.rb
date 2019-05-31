class AddAtraccionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :atraccion, :integer
  end
end
