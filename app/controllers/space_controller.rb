class SpaceController < ApplicationController
  layout 'layout_admin'

  def index
    profil = Profil.find_by_lover_id(session[:id])

    if(profil == nil)
      redirect_to  space_newprofil_path
    else
      if(profil.preference_id == 1)
        @list_profil_lover = Profil.where(sexe:"Homme").where.not(name: "Admin")
      elsif (profil.preference_id == 3)
        @list_profil_lover = Profil.where(sexe:"Femme").where.not(name: "Admin")
      else
        @list_profil_lover = Profil.all.where.not(name: "Admin")
      end
    end

  end
end
