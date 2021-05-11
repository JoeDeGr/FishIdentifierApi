class CreateGenus < ActiveRecord::Migration[6.1]
  def change
    create_table :genus do |t|
      t.string :commonname
      t.string :scientificname
      t.string :family
      t.string :order
      t.string :habitat
      t.string :size
      t.string :gamequalities
      t.string :description


      t.timestamps
    end
  end
end
