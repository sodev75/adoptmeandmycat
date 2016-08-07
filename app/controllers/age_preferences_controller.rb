class AgePreferencesController < ApplicationController
  before_action :set_age_preference, only: [:show, :edit, :update, :destroy]

  # GET /age_preferences
  # GET /age_preferences.json
  def index
    @age_preferences = AgePreference.all
  end

  # GET /age_preferences/1
  # GET /age_preferences/1.json
  def show
  end

  # GET /age_preferences/new
  def new
    @age_preference = AgePreference.new
  end

  # GET /age_preferences/1/edit
  def edit
  end

  # POST /age_preferences
  # POST /age_preferences.json
  def create
    @age_preference = AgePreference.new(age_preference_params)

    respond_to do |format|
      if @age_preference.save
        format.html { redirect_to @age_preference, notice: 'Age preference was successfully created.' }
        format.json { render :show, status: :created, location: @age_preference }
      else
        format.html { render :new }
        format.json { render json: @age_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /age_preferences/1
  # PATCH/PUT /age_preferences/1.json
  def update
    respond_to do |format|
      if @age_preference.update(age_preference_params)
        format.html { redirect_to @age_preference, notice: 'Age preference was successfully updated.' }
        format.json { render :show, status: :ok, location: @age_preference }
      else
        format.html { render :edit }
        format.json { render json: @age_preference.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /age_preferences/1
  # DELETE /age_preferences/1.json
  def destroy
    @age_preference.destroy
    respond_to do |format|
      format.html { redirect_to age_preferences_url, notice: 'Age preference was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_age_preference
      @age_preference = AgePreference.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def age_preference_params
      params.require(:age_preference).permit(:age_range)
    end
end
