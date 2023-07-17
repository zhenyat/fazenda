################################################################################
# Model:  Plant
#
# Purpose: Provides general info about the Plant 
#           - with "Culture" ActiveText
#           - with "Performance Summary" ActiveText
#           - w/o images
#
# Plant attributes:
#   family_id    - FK
#   family_type
#   name         - string,  not NULL, unique
#   sci_name     - string, not NULL, unique
#   common_name  - string, not NULL, unique
#   kind         - integer, enum
#   coldest      - integer, enum
#   warmest      - integer, enum
#   height_min   - float
#   height_max   - float
#   spread_min   - float
#   spread_max   - float
#   bloom_start  - string
#   bloom_end    - string
#   bloom_color  - string
#   light_min    - string
#   light_max    - string
#   soil_texture - string
#   soil_ph      - string
#   status       - enum { active (0) | archived (1) }
#    
#  16.07.2023 ZT
################################################################################
class Plant < ApplicationRecord
  has_rich_text :content    # Culture
  
  belongs_to :family, required: true

  enum kind: %w(
    Conifer Broadleaved\ tree Vine Shrub Herbaceous\ perennial Fern
    Ornamental\ grass\ (incl.\ rushes\ and\ sedges) Annual Miscellaneous
  )
  enum coldest: %w(3 4 5 6 7 8), _suffix: true
  enum warmest: %w(5 6 7 8 9 10 11), _suffix: true
  enum status:  %w(active archived)

  validates :family,      presence: true
  validates :name,        presence: true, uniqueness: true
  validates :sci_name,    presence: true, uniqueness: true
  validates :common_name, presence: true, uniqueness: true
  validates :height_min,  presence: true, numericality: {greater_than: 0.0}
  validates :height_max,  presence: true, numericality: {greater_than: 0.0}
  validates :spread_min,  presence: true, numericality: {greater_than: 0.0}
  validates :spread_max,  presence: true, numericality: {greater_than: 0.0}

end
