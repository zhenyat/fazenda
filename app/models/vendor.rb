################################################################################
# Model:  Vendor
#
# Purpose:
#
# Vendor attributes:
#   name              - string,  not NULL, unique
#   title             - string,  not NULL
#   address             - string
#   phone             - string
#   url             - string
#   about             - string
#   status            - enum { active (0) | archived (1) }
#    
#   
#
#  12.05.2023 ZT
################################################################################
class Vendor < ApplicationRecord
  include Avatarable
  enum status: %w(active archived)
  validates :name,  presence: true, uniqueness: true
  validates :title, presence: true
end
