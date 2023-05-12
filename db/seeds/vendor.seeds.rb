begin
  if Vendor.present? and not Vendor.exists?
    Vendor.create!([
      { name:    'dummy', 
        title:   'Vendor not existing',
        address: '',
        phone:   '',
        url:     '',
        about:   'This is a "dummy" vendor for DB consistency only'
      },
      { name:    'iseli', 
        title:   'Iseli Nursery',
        address: '30590 SE Kelso Rd, Boring, OR 97009',
        phone:   '(800)777-6202',
        url:     'https://www.iselinursery.com',
        about: 'Iseli Nursery is a wholesale grower of rare and beautiful dwarf conifers, Japanese maples, Living Art®, ornamental trees and shrubs'
      },
      
    ])
    puts "===== #{Vendor.count} 'Vendor' record(s) created"
  else
    puts "===== 'Vendor' seeding skipped"
  end
rescue StandardError, AnotherError => e
  puts "----- Achtung! Something went wrong..."
  puts "#{e.inspect}"
end