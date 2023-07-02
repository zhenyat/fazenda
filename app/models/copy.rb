################################################################################
# Model:  Plant
#
# Purpose:
#
# Plant attributes:
#   name           - string,  not NULL, unique
#   sci_name       - string
#   common_name    - string
#   family         - enum
#   kind           - enum
#   coldest        - enum
#   warmest        - enum
#   height_min     - float
#   height_max     - float
#   spread_min     - float
#   spread_max     - float
#   bloom_start    - enum
#   bloom_end      - enum
#   bloom_color    - string
#   light_min      - string
#   light_max      - string
#   soil_texture   - string
#   soil_ph        - string
#   special_reqs   - text
#   description    - text
#   status         - enum { active (0) | archived (1) }
#    
#  01.07.2023 ZT
################################################################################
class Plant < ApplicationRecord
  enum family: %w(Hydrangeaceae Iridaceae Pinaceae)
  enum kind:   %w(
      Conifer Broadleaved\ tree Vine Shrub Herbaceous\ perennial Fern
      Ornamental\ grass\ (incl.\ rushes\ and\ sedges) Annual Miscellaneous
    )
  enum coldest: %w(3 4 5 6 7 8)
  enum warmest: %w(5 6 7 8 9 10 11)
  enum bloom_start: %w(Non-flowering January February March April May June July August September October November December)
  enum bloom_end:   %w(na January February March April May June July August September October November December)
  enum status:  %w(active archived)
  validates :name,  presence: true, uniqueness: true
end
