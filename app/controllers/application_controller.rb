class ApplicationController < ActionController::Base
  def render_not_found
    redirect_to :root_path
  end
end
