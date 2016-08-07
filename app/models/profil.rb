class Profil < ApplicationRecord
  belongs_to :lover
  belongs_to :preference
  belongs_to :age_preference
  has_many :likeOne, :class_name => 'Like', :foreign_key => 'profil_id'
  has_many :likeTwo, :class_name => 'Like', :foreign_key => 'profil_like_id'
  has_many :sender, :class_name => 'Message', :foreign_key => 'profil_sender_id'
  has_many :recipient, :class_name => 'Message', :foreign_key => 'profil_recipient_id'

  has_many :profilmatch_one, :class_name => 'Match', :foreign_key => 'profil_id'
  has_many :profilmatch_two, :class_name => 'Match', :foreign_key => 'profil_two_id'


end
