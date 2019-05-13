# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    super
  end

  def create
      @user = User.new(sign_up_params)
      

      respond_to do |format|
        if @user.save
          
          Group.find(1).add @user
          format.html {  redirect_to root_path, notice: "Cuenta Creada" }
          format.json { render :new, status: :created, location: @user }
        else
          format.html { render :new }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    end

  def update_resource(resource, account_update_params)
    super
    resource.update_without_password(account_update_params)
  end

  def edit
    
  end

  def sign_up_params
    params.require(:user).permit(:name, :last_name, :email, :phone,:password, :password_confirmation, )
  end

  def account_update_params
    params.require(:user).permit(:name, :last_name, :email, :phone, :password, :password_confirmation, :current_password, )
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # def after_sign_out_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
