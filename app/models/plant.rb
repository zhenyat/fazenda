################################################################################
# Model:  Plant
#
# Purpose:
#
# Plant attributes:
#   family_id   - FK
#   family_type
#   name           - string, not NULL, unique
#   sci_name       - string, not NULL, unique
#   common_name    - string, not NULL, unique
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
  belongs_to :family, required: true

  enum kind:   %w(
      Conifer Broadleaved\ tree Vine Shrub Herbaceous\ perennial Fern
      Ornamental\ grass\ (incl.\ rushes\ and\ sedges) Annual Miscellaneous
    )
  enum coldest:     %w(3 4 5 6 7 8), _suffix: true
  enum warmest:     %w(5 6 7 8 9 10 11), _suffix: true
  enum bloom_start: %w(Not\ applicable January February March April May June July August September October November December), _suffix: true
  enum bloom_end:   %w(Not\ applicable January February March April May June July August September October November December), _suffix: true
  enum status:      %w(active archived)

  validates :name,       presence: true, uniqueness: true
  validates :sci_name,   presence: true, uniqueness: true
  validates :name,       presence: true, uniqueness: true
  validates :height_min, presence: true, numericality: {greater_than: 0.0}
  validates :height_max, presence: true, numericality: {greater_than: 0.0}
  validates :spread_min, presence: true, numericality: {greater_than: 0.0}
  validates :spread_max, presence: true, numericality: {greater_than: 0.0}
end
