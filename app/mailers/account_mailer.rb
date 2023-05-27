class AccountMailer < ApplicationMailer
  def notify(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Solar Eclipse Tarot!")
  end
end

