begin
  if (Family.present? and not Family.exists?)
    Family.create name: 'pinaceae', title: 'Pine family'
    Family.create name: 'hydrangeaceae', title: 'Hydrangea family of flowering plants'
    Family.create name: 'iridaceae', title: 'Iris family of flowering plants'
    puts "===== #{Family.count} 'Family' record(s) created"
  else
    puts "===== 'Family' seeding skipped"
  end
rescue StandardError, AnotherError => e
  puts "----- Achtung! Something went wrong..."
  puts "#{e.inspect}"
end
