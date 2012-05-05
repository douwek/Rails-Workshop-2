class SessiesController < ApplicationController
  def new
  end

  def create
    gebruiker = Gebruiker.authenticate(params[:email], params[:wachtwoord])

    respond_to do |format|
      if gebruiker
        session[:gebruiker_id] = gebruiker.id
        format.html { redirect_to root_url, :notice => "Ingelogd" }
#        format.json { head :no_content }
      else
        format.html { redirect_to "/login", :notice => "Incorrect wachtwoord"}
#        format.json { head :no_content }
      end
    end
  end

  def destroy
    session[:gebruiker_id] = nil
    respond_to do |format|
      format.html { redirect_to root_url, :notice => "Uitgelogd!" }
#     format.json { head :no_content }
    end
  end
end
