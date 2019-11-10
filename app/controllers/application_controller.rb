class ApplicationController < ActionController::Base
  def render_not_found
    render :file => "#{RAILS_ROOT}/public/404.html",  :status => 404
  end
end
