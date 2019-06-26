class UserMailer < ApplicationMailer

  def call_user_mail(user, atc)
    @user = user
    @atraccion = atc
    mail(to: @user.email, subject: 'Notificacion Atraccion')
  end

end
