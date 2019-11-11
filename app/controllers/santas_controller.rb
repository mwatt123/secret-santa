class SantasController < ApplicationController
  def show
    @santa = Santa.find_by(token: params[:token])
    render_not_found if @santa.blank?

    @santa.touch
    @recipient = @santa.recipient
  end
end
