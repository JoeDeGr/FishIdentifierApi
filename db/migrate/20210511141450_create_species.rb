class CreateSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :species do |t|
      t.string :commonname
      t.string :scientificname
      t.string :habitat
      t.string :size
      t.string :gamequalities
      t.string :distribution
      t.string :description
      t.integer :genus_id, foreign_key: true

      t.timestamps
    end
  end
end
