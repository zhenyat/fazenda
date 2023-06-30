class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.integer :number, null:false, index: {unique: true}
      t.string  :title,  null:false
      t.string  :comment
      t.integer :status, null: false, default: 0, limit: 1

      t.timestamps
    end
    add_check_constraint :locations, "number > 0"
  end
end
