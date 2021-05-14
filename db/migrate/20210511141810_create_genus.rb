class CreateGenus < ActiveRecord::Migration[6.1]
  def change
    create_table :genus do |t|
      t.string :common_name
      t.string :scientific_name
      t.string :family
      t.string :order
      t.string :habitat
      t.string :size
      t.string :game_qualities
      t.string :description


      t.timestamps
    end
  end
end
