class TicketController < ApplicationController

    def encolar
        if current_user
            @atraccion = Atraccion.find(params[:id])
            if @atraccion.pause == false
                @ticket = Ticket.create()
                #Una vez creado el ticket se procede a lo siguiente:
                if @ticket.save
                    #Define el estado del ticket
                    @estado = TicketEstado.new
                    @estado.estados_id = 1 #Encolado
                    @estado.tickets_id = @ticket.id
                    @estado.save
                #Define la atraccion y el usuario del ticket
                    @operacion = OperacionesAtraccion.new
                    @operacion.users_id = current_user[:id]
                    @operacion.atraccions_id = params[:id]
                    @operacion.tickets_id = @ticket.id
                    @operacion.save
                end
                redirect_to root_path
            else
                redirect_to root_path
            end

        else
            redirect_to user_session_path
        end
    end

    def cambiar_estado

        @estado = TicketEstado.new
        @estado.estados_id = params[:estado]
        @estado.tickets_id = params[:ticket]
        @estado.save
        redirect_to root_path
        
    end

end
