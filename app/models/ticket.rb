class Ticket < ApplicationRecord
    #operaciones
    # has_many :operaciones_atraccions
    # has_many :atraccions, through: :operaciones_atraccions
    # has_many :users, through: :operaciones_atraccions

    #estados
    # has_many :ticket_estados
    # has_many :estados, :through => :ticket_estados
end
