class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.medication_reminder.subject
  #
  def medication_reminder
    @user = params[:user]
    @pet = params[:pet]

    mail(to: @user.email, content_type: "text/html", subject: 'Reminder to human',body: params[:email_body])
  end
end
