class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.medication_reminder.subject
  #
  def medication_reminder
    # @user = params[:user]
    # @pet = params[:pet]

    @user = User.last
    @pet = Pet.last

    mail(to: @user.email, subject: 'Reminder to human')
  end
end
