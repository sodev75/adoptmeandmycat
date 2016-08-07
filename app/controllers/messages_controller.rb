class MessagesController < ApplicationController
  layout 'layout_admin'

  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @profils = Profil.all
    @messages = Message.where(profil_recipient_id_id:session[:idprofil])
    @match = Match.where("profil_id_id = #{session[:idprofil]}").or(Match.where("profil_two_id_id = #{session[:idprofil]}"))

  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    if params[:id] == nil
      @profils = Profil.all

    else
      @profils = Profil.find_by_id(params[:id])

    end

    @message = Message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create recipient=nil, sender=nil, content=nil, redirect_url=nil, msg=nil
    @profils = Profil.all

    if content == nil
      @message = Message.new(message_params)
      @message.profil_sender_id_id = session[:idprofil]
      @message.profil_recipient_id_id = params[:recipient]
      flash[:success] = "Votre message a bien été envoyé."
      if @message.save
        redirect_to space_newmessage_path(params[:recipient])
      end
    else
      @message = Message.new
      @message.content = content
      @message.profil_sender_id_id = sender
      @message.profil_recipient_id_id = recipient
    end



      if @message.save
        unless msg == nil &&  redirect_url == nil
          flash[:msg] = msg
          redirect_to redirect_url
        end
      else
        #format.html { render :new }
        #format.json { render json: @message.errors, status: :unprocessable_entity }
      end

  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:content, :profil_recipient_id_id)
    end
end
