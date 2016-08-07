class Message < ApplicationRecord
  belongs_to :sender, :class_name => 'Profil', :foreign_key => 'profil_sender_id_id'
  belongs_to :recipient, :class_name => 'Profil', :foreign_key => 'profil_recipient_id_id'
end
