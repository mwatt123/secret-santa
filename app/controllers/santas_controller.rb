class SantasController < ApplicationController
  def show
    @santa = Santa.find_by(token: params[:token])
    render_not_found unless @santa.present?

    @recipient = @santa.recipient
  end
end
