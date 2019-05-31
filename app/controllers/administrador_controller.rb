class AdministradorController < ApplicationController

    # Muestra a todos los usuarios
    def editusers
        @user = User.all
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

end
