class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.email_user
  layout 'mailer'
end
