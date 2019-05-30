class AdministradorController < ApplicationController

    def editusers
        @user = User.all
    end

    def edit
        @user = User.find(params[:id])
        @group = Group.where("id != 1")
    end

    def asignarrol
        @user = User.find(params[:usuario])
        Group.find(params[:grupo]).add @user
    end

end
