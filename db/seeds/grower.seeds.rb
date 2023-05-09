begin
  if Grower.present? and not Grower.exists?
    Grower.create!([
      { name:    'iseli', 
        title:   'Iseli Nursery',
        address: '30590 SE Kelso Rd, Boring, OR 97009',
        phone:   '(800)777-6202',
        url:     'https://www.iselinursery.com',
        about: 'Iseli Nursery is a wholesale grower of rare and beautiful dwarf conifers, Japanese maples, Living Art®, ornamental trees and shrubs'
      },
      
    ])
    puts "===== #{Grower.count} 'Grower' record(s) created"
  else
    puts "===== 'Grower' seeding skipped"
  end
rescue StandardError, AnotherError => e
  puts "----- Achtung! Something went wrong..."
  puts "#{e.inspect}"
end