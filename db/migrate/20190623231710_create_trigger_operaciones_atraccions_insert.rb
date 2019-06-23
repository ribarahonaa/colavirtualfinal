# This migration was auto-generated via `rake db:generate_trigger_migration'.
# While you can edit this file, any changes you make to the definitions here
# will be undone by the next auto-generated trigger migration.

class CreateTriggerOperacionesAtraccionsInsert < ActiveRecord::Migration[5.2]
  def up
    create_trigger("operaciones_atraccions_after_insert_row_tr", :generated => true, :compatibility => 1).
        on("operaciones_atraccions").
        after(:insert) do
      "INSERT INTO STATS(user_id, atraccion_id, ticket_id, created_at) VALUES(NEW.users_id, NEW.atraccions_id, NEW.tickets_id, NEW.created_at);"
    end
  end

  def down
    drop_trigger("operaciones_atraccions_after_insert_row_tr", "operaciones_atraccions", :generated => true)
  end
end
