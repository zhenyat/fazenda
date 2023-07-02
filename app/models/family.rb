################################################################################
# Model:  Family
#
# Purpose:
#
# Family attributes:
#   name    - string,  not NULL, unique
#   title   - string,  not NULL
#   comment - string
#   status  - enum { active (0) | archived (1) }
#    
#  01.07.2023 ZT
################################################################################
class Family < ApplicationRecord
  has_many :plants, dependent: :destroy
  enum status: %w(active archived)
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
