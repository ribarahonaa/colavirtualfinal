class CreateStat < ActiveRecord::Migration[5.2]
  def change
    create_table :stats do |t|
      t.integer :user_id
      t.integer :atraccion_id
      t.integer :ticket_id
      t.datetime :created_at
    end
  end
end
