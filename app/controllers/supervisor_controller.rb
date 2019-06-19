class SupervisorController < ApplicationController
    
    def index
        @supervisor = OperacionesAtraccion.where("atraccions_id =  #{current_user[:atraccion] }")
    end

    def cambiar_estado

        @estado = TicketEstado.new
        @estado.estados_id = params[:estado]
        @estado.tickets_id = params[:ticket]
        @estado.save
        redirect_to supervisor_index_path
        
    end
end
