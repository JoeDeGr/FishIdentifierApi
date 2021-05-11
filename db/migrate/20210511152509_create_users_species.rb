class CreateUsersSpecies < ActiveRecord::Migration[6.1]
  def change
    create_table :users_species do |t|
      t.references :user, index:true, foreign_key:true
      t.references :species, index:true, foreign_key:true

      t.timestamps
    end
  end
end
