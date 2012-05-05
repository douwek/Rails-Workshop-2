class GebruikersController < ApplicationController
  # GET /gebruikers
  # GET /gebruikers.json
  def index
    @gebruikers = Gebruiker.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @gebruikers }
    end
  end

  # GET /gebruikers/1
  # GET /gebruikers/1.json
  def show
    @gebruiker = Gebruiker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @gebruiker }
    end
  end

  # GET /gebruikers/new
  # GET /gebruikers/new.json
  def new
    @gebruiker = Gebruiker.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @gebruiker }
    end
  end

  # GET /gebruikers/1/edit
  def edit
    @gebruiker = Gebruiker.find(params[:id])
  end

  # POST /gebruikers
  # POST /gebruikers.json
  def create
    @gebruiker = Gebruiker.new(params[:gebruiker])

    respond_to do |format|
      if @gebruiker.save
        format.html { redirect_to @gebruiker, :notice => 'Gebruiker was successfully created.' }
        format.json { render :json => @gebruiker, :status => :created, :location => @gebruiker }
      else
        format.html { render :action => "new" }
        format.json { render :json => @gebruiker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gebruikers/1
  # PUT /gebruikers/1.json
  def update
    @gebruiker = Gebruiker.find(params[:id])

    respond_to do |format|
      if @gebruiker.update_attributes(params[:gebruiker])
        format.html { redirect_to @gebruiker, :notice => 'Gebruiker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @gebruiker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gebruikers/1
  # DELETE /gebruikers/1.json
  def destroy
    @gebruiker = Gebruiker.find(params[:id])
    @gebruiker.destroy

    respond_to do |format|
      format.html { redirect_to gebruikers_url }
      format.json { head :no_content }
    end
  end
end
