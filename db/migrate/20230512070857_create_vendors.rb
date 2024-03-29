class CreateVendors < ActiveRecord::Migration[7.0]
  def change
    create_table :vendors do |t|
      t.string  :name,   null:false, index: {unique: true}
      t.string  :title,  null:false
      t.string  :address
      t.string  :phone
      t.string  :url
      t.string  :about
      t.integer :status, null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
