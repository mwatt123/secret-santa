class SantaMailer < ApplicationMailer
  def notification_email
    @santa = params[:santa]
    @url   = "https://www.matthew-watt.com/santas/#{@santa.token}"
    mail(to: @santa.email, subject: 'Watt Family Secret Santa')
  end
end
