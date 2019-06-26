class AdministradorController < ApplicationController

    # Muestra a todos los usuarios
    def editusers
        @user = User.where("id != 1")
    end

    # Muestra al usuario seleccionado
    def edit
        @user = User.find(params[:id])
        @group = Group.where("id != 1")
    end

    # Asigna rol al usuario
    def asignarrol
        @user = User.find(params[:usuario])
        Group.find(params[:grupo]).add @user

        redirect_to administrador_editusers_path
    end

    # Buscar usuarios que sean supervisores
    def supervisores
        @supervisor = User.all
    end

    # Supervisor a asignar
    def asignar
        @supervisor = User.find(params[:id])
        @atraciones = Atraccion.all
    end

    # Asignar atraccion
    def asignaratraccion
        @supervisor = User.find(params[:usuario])
        @supervisor.atraccion = params[:atraccion]
        @supervisor.save

        redirect_to administrador_supervisores_path
    end

    def delete_rol
        @user = User.find(params[:user]) # Busca al usuario
        @group = Group.find(params[:rol]) # Busca el grupo

        @user.groups.delete(@group) # Elimina al usuario del grupo

        redirect_to administrador_edit_path(id: @user.id)
    end

    # def eliminar
    #     @user =  User.find(params[:id])
    #     @operacion = OperacionesAtraccion.where(" users_id = #{ params[:id] }")
    #     @operacion.delete_all
          
        
       
    #     @user.destroy

    #     redirect_to administrador_editusers_path
    #   end  
    
end
