################################################################################
# Model:  Area
#
# Purpose:
#
# Area attributes:
#   name,             - string
#   title             - string,  not NULL
#   description       - text
#   status            - enum { active (0) | archived (1) }
#
#  29.06.2023 ZT
################################################################################
class Area < ApplicationRecord
  include ImagesHandleable
  enum status: %w(active archived)
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
