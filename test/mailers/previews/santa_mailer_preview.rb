# Preview all emails at http://localhost:3000/rails/mailers/santa_notifier_mailer
class SantaMailerPreview < ActionMailer::Preview
  def notification_email
    SantaMailer.notification_email(Santa.last)
  end
end
