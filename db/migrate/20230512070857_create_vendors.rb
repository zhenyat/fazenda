class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string :name
      t.string :title
      t.string :address
      t.string :phone
      t.string :url
      t.string :about
      t.integer :status

      t.timestamps
    end
  end
end
