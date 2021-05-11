class CreateUsersGenus < ActiveRecord::Migration[6.1]
  def change
    create_table :users_genus do |t|
      t.references :user, index:true, foreign_key:true
      t.references :genus, index:true, foreign_key:true

      t.timestamps
    end
  end
end
