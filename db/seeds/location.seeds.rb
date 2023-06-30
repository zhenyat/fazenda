begin
  if Location.present? and not Location.exists?
    Location.create!([
      { number:  1, title:  'Decorative garden #1'},
      { number:  2, title:  'Decorative garden #2 East'},
      { number:  3, title:  'Decorative garden #2 North'},
      { number:  4, title:  'Other within the chainlink'},
      { number:  5, title:  'SE corner'},
      { number:  6, title:  'Street-side, East'},
      { number:  7, title:  'Street-side, West'},
      { number:  8, title:  'Uphill lawn'},
      { number:  9, title:  'Downhill lawn'},
      { number: 10, title:  'Central garden'},
      { number: 11, title:  'Herbaceous, SW'},
      { number: 12, title:  'Herbaceous, W'},
      { number: 13, title:  'SW corner'},
      { number: 14, title:  'Pond area, S'},
      { number: 15, title:  'Pond area, W'},
      { number: 16, title:  'Pond area, Around the stonework'},
      { number: 17, title:  'Ex-NW corner, E'},
      { number: 18, title:  'Ex-NW corner, W'},
      { number: 19, title:  'Winterberry hollies'},
      { number: 20, title:  'Encore azaleas'},
      { number: 21, title:  'Elegant groundcovers'},
      { number: 22, title:  'Bedroom garden'},
      { number: 23, title:  'South of Bedroom garden'},
      { number: 24, title:  'Herbaceous #1'},
      { number: 25, title:  'Asian-West'},
      { number: 26, title:  'Mr. Bean garden'},
      { number: 27, title:  'Iris garden'},
      { number: 28, title:  'Peony garden'},
      { number: 29, title:  'Opposite Ex-NW'},
      { number: 30, title:  'Woodlands, W'},
      { number: 40, title:  'MD front'},
      { number: 41, title:  'MD side, E'},
      { number: 42, title:  'MD back, E'},
      { number: 43, title:  'MD back, S'},
      { number: 44, title:  'MD heart-shaped'},
      { number: 45, title:  'MD around dogwood'},
      { number: 46, title:  'MD, around AC'}
    ])
    puts "===== #{Location.count} 'Location' record(s) created"
  else
    puts "===== 'LocationLocation' seeding skipped"
  end
rescue StandardError, AnotherError => e
  puts "----- Achtung! Something went wrong..."
  puts "#{e.inspect}"
end