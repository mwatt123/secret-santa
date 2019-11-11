class SantaMailer < ApplicationMailer
  def notification_email(santa)
    @name = santa.name
    @url  = "https://www.matthew-watt.com/santas/#{santa.token}"
    mail(to: santa.email, subject: "#{santa.name} - Watt Family Secret Santa")
  end
end
