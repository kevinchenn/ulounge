class ApplicationController < ActionController::Base
  protect_from_forgery
  #before_filter :authenticate_user!
  #def current_user
  # UserSession.find
  #end
end
