class ApplicationController < ActionController::Base
  include SqlProbe::RequestListener if defined? SqlProbe
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= Person.find() if current_user_id
  end

  def current_user_id
    session[:current_user_id]
  end
end
