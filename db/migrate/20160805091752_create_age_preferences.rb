class CreateAgePreferences < ActiveRecord::Migration[5.0]
  def change
    create_table :age_preferences do |t|
      t.string :age_range
      t.timestamps
    end
  end
end
