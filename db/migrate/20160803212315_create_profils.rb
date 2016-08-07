class CreateProfils < ActiveRecord::Migration[5.0]
  def change
    create_table :profils do |t|
      t.string :name
      t.string :age
      t.string :hobbies
      t.string :sexe
      t.string :catname
      t.string :colorcat
      t.string :coloreyes
      t.string :hair
      t.string :message
      t.string :picture
      t.string :city
      t.belongs_to :lover
      t.belongs_to :preference
      t.belongs_to :age_preference
      t.timestamps
    end
  end
end
