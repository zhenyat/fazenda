class CreatePlants < ActiveRecord::Migration[7.0] 
  def change
    create_table :plants do |t|
      t.references :family,    null: false, foreign_key: true
      t.string  :name,         null:false, index: {unique: true}
      t.string  :sci_name,     null:false, index: {unique: true}
      t.string  :common_name,  null:false, index: {unique: true}
      t.integer :kind,         null: false, default: 0, limit: 1
      t.integer :coldest,      null: false, default: 0, limit: 1
      t.integer :warmest,      null: false, default: 0, limit: 1
      t.float    :height_min,   null: false
      t.float    :height_max,   null: false
      t.float    :spread_min,   null: false
      t.float    :spread_max,   null: false
      t.string  :bloom_start,  null: false
      t.string  :bloom_end,    null: false
      t.string  :bloom_color,  null: false
      t.string  :light_min,    null: false
      t.string  :light_max,    null: false
      t.string  :soil_texture, null: false
      t.string  :soil_ph,      null: false
      t.integer :status,       null: false, default: 0, limit: 1

      t.timestamps
    end
    add_check_constraint :plants, "height_min > 0.0"
    add_check_constraint :plants, "height_max > 0.0"
    add_check_constraint :plants, "spread_min > 0.0"
    add_check_constraint :plants, "spread_max > 0.0"
  end
end
