################################################################################
# Model:  Location
#
# Purpose:
#
# Location attributes:
#   number - Location number - integer, not NULL, unique
#   title  - Location name   - string,  not NULL
#   comment                  - string
#   status                   - enum { active (0) | archived (1) }
#    
#  30.06.2023 ZT
################################################################################
class Location < ApplicationRecord
  include ImagesHandleable
  enum status: %w(active archived)
  validates :number, presence: true, uniqueness: true, numericality: {greater_than: 0}
  validates :title,  presence: true
end
