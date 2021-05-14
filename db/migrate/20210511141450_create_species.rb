class CreateSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :species do |t|
      t.string :common_name
      t.string :scientific_name
      t.string :species_name
      t.string :habitat
      t.string :size
      t.string :game_qualities
      t.string :distribution
      t.string :description
      t.integer :genus_id, foreign_key: true

      t.timestamps
    end
  end
end
