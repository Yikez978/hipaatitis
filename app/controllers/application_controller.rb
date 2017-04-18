class ApplicationController < ActionController::Base
  include SqlProbe::RequestListener if defined? SqlProbe
  protect_from_forgery with: :exception
end
