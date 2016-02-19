class PetsUsers < ActiveRecord::Migration
  def change
    create_table :pets_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :pet, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
