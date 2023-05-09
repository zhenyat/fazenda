################################################################################
# Model:  Grower
#
# Purpose:
#
# Grower attributes:
#   name       - string,  not NULL, unique
#   title      - string,  not NULL
#   address    - string
#   phone      - string
#   url        - string
#   about      - string
#   status     - enum { active (0) | archived (1) 
#
#  08.05.2023 ZT
################################################################################
class Grower < ApplicationRecord
  include Avatarable

  enum status: %w(active archived)
  
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
