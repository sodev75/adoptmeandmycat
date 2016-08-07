class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :require_login

  private
  def require_login
      unless session[:logged]
        flash[:error] = "You must be logged in"+"to access this section"
        redirect_to login_path
      else
        @id= session[:id]
        @email = session[:email]

        #@name = session[:name];
      end
  end

end
