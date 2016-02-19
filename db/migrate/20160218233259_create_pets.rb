class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.string :image_url
      t.text :description
      t.string :ad_url

      t.timestamps null: false
    end
  end
end
