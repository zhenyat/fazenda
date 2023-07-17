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
        about:   'Iseli Nursery is a wholesale grower of rare and beautiful dwarf conifers, Japanese maples, Living Art®, ornamental trees and shrubs'
      },
      { name:    'sun', 
        title:   'SUN NURSERIES Inc.',
        address: '14790 Bushy Park Rd Woodbine, MD 21797',
        phone:   '(410) 442-2090',
        url:     'https://www.sunnurseries.com',
        about:   'The Company provides high quality, locally grown nursery stock, garden center and services in Maryland'
      },
      { name:    'shreiners', 
        title:   "Schreiner's Iris Gardens",
        address: '3625 Quinaby Rd NE, Salem, OR 97303',
        phone:   '(503) 393-3232',
        url:     'https://www.schreinersgardens.com',
        about:   'Growing the finest Iris since 1925'
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