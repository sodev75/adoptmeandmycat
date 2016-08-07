class MatchesController < ApplicationController
  before_action :set_match, only: [:show, :edit, :update, :destroy]

  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.all
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
  end

  # GET /matches/new
  def new
    @match = Match.new
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.json
  def create profil_one, profil_two
    @match = Match.new(match_params)
    @profil = Profil.new
    @profil_one = Profil.find_by_id(profil_one)
    @profil_two = Profil.find_by_id(profil_two)
    @match.profil_id_id = profil_one
    @match.profil_two_id_id = profil_two

    if @match.save
      controller_you_want = MessagesController.new
      controller_you_want.request = request
      controller_you_want.response = response

      #  Envoie des messages de l'admin Vous pouvez desormais envoyer des messages à votre matching lover
      msg = "Bonjour #{@profil_one.name}, Vous avez eu un match avec <a href='#{space_profil_path(@profil_two.id)}''>#{ @profil_two.name}</a>. Tu peux desormais converser avec. Enjoy and love. Admin AdoptMeAndMyCat"
      msgtwo = "Bonjour #{@profil_two.name}, Vous avez eu un match avec <a href='#{space_profil_path(@profil_one.id)}''>#{ @profil_one.name}</a>. Tu peux desormais converser avec. Enjoy and love. Admin AdoptMeAndMyCat"

      controller_you_want.create(profil_one, "13", msg.html_safe)
      controller_you_want.create(profil_two, "13", msgtwo.html_safe)

    redirect_to space_profil_path(profil_one)
    else
      flash[:error] = @match.errors
      redirect_to space_profil_path(profil_one)
    end
  end

  # PATCH/PUT /matches/1
  # PATCH/PUT /matches/1.json
  def update
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @match }
      else
        format.html { render :edit }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match.destroy
    respond_to do |format|
      format.html { redirect_to matches_url, notice: 'Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_match
      @match = Match.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def match_params
      params.fetch(:match, {})
    end
end
