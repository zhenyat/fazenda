begin
  if (Plant.present? and not Plant.exists?)
    Plant.create!([
      {
        family_id: 1,
        name: "picabipend", sci_name: "Picea abies 'Pendula'", 
        common_name: "Weeping Norway Spruce",
        kind: 0, coldest: 0, warmest: 2,
        height_min: 4.0, height_max: 15.0, spread_min: 4.0, spread_max: 15.0,
        bloom_start: 0, bloom_end: 0, bloom_color: "Non-flowering",
        light_min: "Full sun", light_max: "Full sun",
        soil_texture: "Wide range, Well-drained ", soil_ph: "Acidic"
      },
      {
        family_id: 2,
        name: "hyserblbil", sci_name: "Hydrangea serrata 'Blue Billow'", 
        common_name: "Japanese mountain hydrangea 'Blue Billow'",
        kind: 3, coldest: 3, warmest: 4,
        height_min: 2.0, height_max: 3.0, spread_min: 2.0, spread_max: 4.0,
        bloom_start: 6, bloom_end: 7, bloom_color: "White, Blue",
        light_min: "Partial shade", light_max: "Full sun",
        soil_texture: "Loam, Slit, Well-drained", soil_ph: "Acidic"
      },
      {
        family_id: 3,
        name: "irarmaged", sci_name: "Iris germanica 'Armageddon'", 
        common_name: "Tall bearded iris 'Armageddon'",
        kind: 4, coldest: 0, warmest: 4,
        height_min: 3.0, height_max: 3.5, spread_min: 1.0, spread_max: 3.0,
        bloom_start: 5, bloom_end: 6, bloom_color: "White, Lavender, Purple",
        light_min: "Full sun", light_max: "Full sun",
        soil_texture: "Wide range, Well-drained", soil_ph: "Neutral"
      }
    ])
    puts "===== #{Plant.count} 'Plant' record(s) created"
  else
    puts "===== 'Plant' seeding skipped"
  end
rescue StandardError, AnotherError => e
  puts "----- Achtung! Something went wrong..."
  puts "#{e.inspect}"
end
