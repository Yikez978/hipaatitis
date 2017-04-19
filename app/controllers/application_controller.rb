class ApplicationController < ActionController::Base
  include SqlProbe::RequestListener if defined? SqlProbe
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= Person.find(current_user_id) if current_user_id
  end
  helper_method :current_user

  def current_user_id
    session[:current_user_id]
  end
  helper_method :current_user_id
end
