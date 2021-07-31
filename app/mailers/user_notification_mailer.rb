class UserNotificationMailer < ApplicationMailer

  def send_status_change_email_to_user
    @user = params[:user]
    @archived_by = @user.archive_by

    mail(
        to:  @user.email,
        from: 'hiteshmatre@gmail.com',
        subject: "You account set #{params[:status]} by #{@archived_by.email}",
        body: "Hi #{@user.email}, Your account status set - #{params[:status]} by #{@archived_by.email}."
    )
  end
end
