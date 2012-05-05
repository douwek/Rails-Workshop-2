class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :ingelogd

  private
  def ingelogd
    sessie = session[:gebruiker_id]
    @ingelogd ||= Gebruiker.find(sessie) if sessie
  end
end
