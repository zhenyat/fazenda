class CreatePlants < ActiveRecord::Migration[7.0]
  def change
    create_table :plants do |t|
      t.string  :name
      t.string  :sci_name
      t.string  :common_name
      t.integer :family,      null: false, default: 0, limit: 1
      t.integer :kind,        null: false, default: 0, limit: 1
      t.integer :coldest,     null: false, default: 0, limit: 1
      t.integer :warmest,     null: false, default: 0, limit: 1
      t.float    :height_min
      t.float    :height_max
      t.float    :spread_min
      t.float    :spread_max
      t.integer :bloom_start, null: false, default: 0, limit: 1
      t.integer :bloom_end,   null: false, default: 0, limit: 1
      t.string  :bloom_color
      t.string  :light_min
      t.string  :light_max
      t.string  :soil_texture
      t.string  :soil_ph
      t.text    :special_reqs
      t.text    :description
      t.integer :status,      null: false, default: 0, limit: 1

      t.timestamps
    end
    add_check_constraint :plants, "height_min => 0.0"
    add_check_constraint :plants, "height_max => 0.0"
    add_check_constraint :plants, "spread_min => 0.0"
    add_check_constraint :plants, "spread_max => 0.0"
  end
end
