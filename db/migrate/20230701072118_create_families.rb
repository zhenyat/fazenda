class CreateFamilies < ActiveRecord::Migration[7.0]
  def change
    create_table :families do |t|
      t.string  :name,   null:false, index: {unique: true}
      t.string  :title,  null:false
      t.string  :comment
      t.integer :status, null: false, default: 0, limit: 1

      t.timestamps
    end
  end
end
