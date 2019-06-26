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

    def pausar
        @atraccion = Atraccion.find(params[:atc])
        @atraccion.pause = true
        @atraccion.save

        redirect_to supervisor_index_path
    end

    def play
        @atraccion = Atraccion.find(params[:atc])
        @atraccion.pause = false
        @atraccion.save

        redirect_to supervisor_index_path
    end

    def llamar
        @user = User.find(params[:id])
        @atraccion = Atraccion.find(params[:atc])
        UserMailer.call_user_mail(@user, @atraccion).deliver

        redirect_to supervisor_index_path
    end

    def masivo

        @atraccion = Atraccion.find(params[:atc])
        @usuarios = params[:usuarios]

        @usuarios.split(',').each do |u|
            @user = User.find(u)
            UserMailer.call_user_mail(@user, @atraccion).deliver
        end

        redirect_to supervisor_index_path
    end
end
