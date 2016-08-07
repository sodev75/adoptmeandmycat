class LikesController < ApplicationController
  before_action :set_like, only: [:show, :edit, :update, :destroy]

  # GET /likes
  # GET /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1
  # GET /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes
  # POST /likes.json
  def create

    @like = Like.new(like_params)
    @like.profil_like_id = session[:idprofil] #moi
    @like.profil_id = params[:profil_id] #lui

    respond_to do |format|
      if @like.save
        #si le profil qui like @like.profil_like_id a lui aussi ete like
        liketo = @like.exist_like(params[:profil_id],session[:idprofil])
        if liketo == TRUE
          controller_you_want = MatchesController.new
          controller_you_want.request = request
          controller_you_want.response = response
          controller_you_want.create(session[:idprofil], params[:profil_id])
        end
        format.html { redirect_to space_profil_path(@like.profil_id) , notice: 'Like was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /likes/1
  # PATCH/PUT /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: 'Like was successfully updated.' }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1
  # DELETE /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: 'Like was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.fetch(:like, {})
    end
end
