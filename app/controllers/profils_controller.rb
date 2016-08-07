class ProfilsController < ApplicationController
  layout 'layout_admin'

  before_action :set_profil, only: [:show, :edit, :update, :destroy]

  # GET /profils
  # GET /profils.json
  def index
    @profils = Profil.all
    @preferences = Preference.all
    @age_preferences = AgePreference.all
  end

  # GET /profils/1
  # GET /profils/1.json
  def show

    @like = Like.new
    like = @like.exist_like(session[:idprofil],@profil.id)

    if like == false
      @btnlike = TRUE
    else
      @btnlike = FALSE
    end

  end

  # GET /profils/new
  def new
    @profil = Profil.new
    @preferences = Preference.all
    @age_preferences = AgePreference.all
  end

  # GET /profils/1/edit
  def edit
    @preferences = Preference.all
    @age_preferences = AgePreference.all
    profil = Profil.find_by_lover_id(@id)

    if(profil == nil)
      redirect_to  space_newprofil_path
    end
  end

  # POST /profils
  # POST /profils.json
  def create
    @preferences = Preference.all
    @age_preferences = AgePreference.all
    @profil = Profil.new(profil_params)
    @profil.lover_id = session[:id]
    @profil.sexe = params[:sexe]
    @profil.preference_id = params[:preference]
    @profil.age_preference_id = params[:age_preference]

    respond_to do |format|
      if @profil.save
        session[:idprofil] = @profil.id
        format.html { redirect_to space_path, notice: 'Profil was successfully created.' }
      else
        format.html { redirect_to space_path, notice: 'Profil was successfully created.' }
        #return @profil.errors

      end
    end
  end

  # PATCH/PUT /profils/1
  # PATCH/PUT /profils/1.json
  def update
    respond_to do |format|
      @profil.sexe = params[:sexe]
      @profil.preference_id = params[:preference]
      @profil.age_preference_id = params[:age_preference]
      if @profil.update(profil_params)
        format.html { redirect_to space_myprofil_path, notice: 'Profil was successfully updated.' }
        format.json { render :show, status: :ok, location: @profil }
      else
        format.html { render :edit }
        format.json { render json: @profil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profils/1
  # DELETE /profils/1.json
  def destroy
    @profil.destroy
    respond_to do |format|
      format.html { redirect_to profils_url, notice: 'Profil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profil
      @profil = Profil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profil_params
      params.require(:profil).permit(:name, :age, :hobbies, :sexe, :catname, :colorcat, :coloreyes, :hair, :message, :picture, :city)
    end
end
