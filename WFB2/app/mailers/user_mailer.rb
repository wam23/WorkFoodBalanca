class UserMailer < ActionMailer::Base
  default from: "info@wfb.ch"

  def account_activation(user)
    @user = user
    subject = "Anmeldung bestätigen"
    if @user.activated?
      subject ="Anmeldung erhalten"
    end
    mail to: user.email, subject: subject, bcc: "info@wfb.ch"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "Passwort Reset", bcc: "info@wfb.ch"
  end
  
  def activation_successful(user)
    @user = user
    mail to: user.email, subject: "Aktivierung erfolgreich", bcc: "info@wfb.ch"
  end
  
end
