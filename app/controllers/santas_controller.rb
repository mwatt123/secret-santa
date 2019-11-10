class SantasController < ApplicationController
  def show
    @santa = Santa.find_by(token: params[:token])
    render_not_found if @santa.blank?

    @recipient = @santa.recipient
  end
end
