class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.medication_reminder.subject
  #
  def medication_reminder
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Remenber to human')
  end
end
