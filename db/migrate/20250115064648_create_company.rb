class CreateCompany < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :address
      t.string :cnpj
      t.string :company_name
      t.string :phone
      t.string :whatsapp

      t.timestamps
    end
  end
end
