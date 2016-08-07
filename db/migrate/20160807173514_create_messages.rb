class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :content
      t.belongs_to :profil_recipient_id
      t.belongs_to :profil_sender_id
      t.timestamps
    end
  end
end
