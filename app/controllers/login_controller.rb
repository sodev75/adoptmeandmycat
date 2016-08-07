class LoginController < ApplicationController
  skip_before_action :require_login

  def show
    render template:"login/index"
  end
  def send_data
    email = params[:email];
    if Lover.find_by_email(params[:email]) && Lover.find_by_password(params[:password])
      user = Lover.find_by_email(params[:email])
      # mettre l id dedans pour le space
      session[:id] = user.id
      session[:email] = user.email
      session[:logged] = TRUE;
      profil = Profil.find_by_lover_id(user.id)
      if(profil == nil)
        redirect_to  space_newprofil_path
      else
        session[:idprofil] = profil.id
        redirect_to space_path
      end

    else
      flash[:wrong] = "Identifiants inconnus."
      redirect_to login_path
    end
  end
  def logout
    session[:logged] =nil
    session[:id] =nil
    session[:idprofil] =nil
    flash[:logout] = "Tu es bien deconnecté."
    $logged=FALSE;
    redirect_to root_path
  end
end
