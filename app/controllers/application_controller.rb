class ApplicationController < ActionController::Base
  def render_not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
