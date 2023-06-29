begin
  if Area.present? and not Area.exists?
    Area.create!([
      { name:        'peonies',
        title:       'The Plant Area with peonies',
        description: 'Peonies area located at ...',
      }    
    ])
    puts "===== #{Area.count} 'Area' record(s) created"
  else
    puts "===== 'Area' seeding skipped"
  end
rescue StandardError, AnotherError => e
  puts "----- Achtung! Something went wrong..."
  puts "#{e.inspect}"
end