class Match < ApplicationRecord
  belongs_to :profilmatch_one, :class_name => 'Profil', :foreign_key => 'profil_id_id'
  belongs_to :profilmatch_two, :class_name => 'Profil', :foreign_key => 'profil_two_id_id'
end
