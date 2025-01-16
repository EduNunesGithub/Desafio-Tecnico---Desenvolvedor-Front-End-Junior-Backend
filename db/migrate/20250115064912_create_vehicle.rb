class CreateVehicle < ActiveRecord::Migration[6.0]
  def change
    create_table :vehicles do |t|
      t.json :description
      t.json :features
      t.json :image
      t.text :legal_text
      t.string :name
      t.float :price
      t.string :subheading
      t.string :video

      t.timestamps
    end
  end
end
