class UserMailer < ApplicationMailer

  def call_user_mail(user)
    @user = user
    mail(to: @user.email, subject: 'Notificacion Atraccion')
  end

end
