class RegisterController < ApplicationController
  skip_before_action :require_login

  def show
    render template:"register/index"
  end
  def send_data
    if params[:email] != "" && params[:password]  != ""
      if(Lover.find_by_email(params[:email]))
        flash[:wrong] = "Cet email existe déjà en base."
        redirect_to login_path
        session[:logged] = FALSE;
      else
        @lover = Lover.create(email: params[:email],password: params[:password])
        flash[:bienvenue] = "Bienvenue Guest."
        session[:id] =@lover.id
        session[:email] = @lover.email

        session[:logged] = TRUE
        redirect_to  space_newprofil_path
      end
    else
      session[:logged] = FALSE;
      flash[:wrong] = "Identifiants inconnus."
      redirect_to register_path
    end
  end
end
