class CreateMatches < ActiveRecord::Migration[5.0]
  def change
    create_table :matches do |t|
      t.belongs_to :profil_id
      t.belongs_to :profil_two_id
      t.timestamps
    end
  end
end
