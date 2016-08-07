class Like < ApplicationRecord
  belongs_to :profil, :class_name => 'Profil', :foreign_key => 'profil_id'
  belongs_to :profil_like, :class_name => 'Profil', :foreign_key => 'profil_like_id'

  def exist_like profil_id, profil_likeid
     Like.where(profil_like_id:profil_id).where(profil_id:profil_likeid).exists?
  end

end
