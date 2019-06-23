class OperacionesAtraccion < ApplicationRecord
    # belongs_to :tickets
    # belongs_to :users
    # belongs_to :atraccions


    trigger.after(:insert) do
        "INSERT INTO STATS(user_id, atraccion_id, ticket_id, created_at) VALUES(NEW.users_id, NEW.atraccions_id, NEW.tickets_id, NEW.created_at)"
    end
end