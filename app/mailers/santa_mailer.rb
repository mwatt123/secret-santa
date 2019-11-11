class SantaMailer < ApplicationMailer
  def notification_email(santa)
    @santa = santa
    @url   = "https://www.matthew-watt.com/santas/#{@santa.token}"
    mail(to: @santa.email, subject: 'Watt Family Secret Santa')
  end
end
