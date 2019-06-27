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
        @estado = TicketEstado.new
        @estado.estados_id = params[:estado]
        @estado.tickets_id = params[:ticket]
        @estado.save
        @user = User.find(params[:id])
        @atraccion = Atraccion.find(params[:atc])
        UserMailer.call_user_mail(@user, @atraccion).deliver

        redirect_to supervisor_index_path
    end

    def contactar
        @user = User.find(params[:id])
        @atraccion = Atraccion.find(params[:atc])
        UserMailer.call_user_mail(@user, @atraccion).deliver

        redirect_to supervisor_index_path
    end

    def masivo
        @usuarios = params[:usuarios]
        @usuarios.split(",").each do |u|
            @user = User.find(u)
            @atraccion = Atraccion.find(params[:atc])
            UserMailer.call_user_mail(@user, @atraccion).deliver
        end

        redirect_to supervisor_index_path
    end

    def servidos
        @tickets = params[:tickets_id]
        @tickets.split(",").each do |t|
            @estado = TicketEstado.new
            @estado.estados_id = params[:estado]
            @estado.tickets_id = t
            @estado.save
        end
        redirect_to supervisor_index_path
        
    end

    def cambiar_estado_masivo

        @atr = params[:atraccion]
        @tickets = params[:tickets_id]
        @usuarios = params[:usuarios].split(",")
        @cont = 0
        @tickets.split(",").each do |t|
            @estado = TicketEstado.new
            @estado.estados_id = params[:estado]
            @estado.tickets_id = t
            @estado.save

            @user = User.find(@usuarios[@cont])
            @atraccion = Atraccion.find(@atr)
            UserMailer.call_user_mail(@user, @atraccion).deliver
            @cont += 1
        end
        redirect_to supervisor_index_path
        
    end
end
