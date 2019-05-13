class RenameType < ActiveRecord::Migration[5.2]
  def change
    rename_column :groups, :type, :kind
  end
end
