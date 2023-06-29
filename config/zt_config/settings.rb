################################################################################
#   settings.rb:  Sets Constants and other Parameters for the run
#                 Called by: zt_load_config.rb
#   Relative path MUST BE applied to public/images, otherwise - sprockets error
#
#   11.10.2016  ZT  Inherited from BKC 95km
#   09.11.2016  MULTILINGUAL added
################################################################################

##### Debugging   #####
ZT_DEBUG = ZT_CONFIG['debug']['status']

if ZT_CONFIG['debug']['path'].nil? || ZT_CONFIG['debug']['path'].empty?
  ZT_LOG_FILE = nil
else
  ZT_LOG_FILE = "#{Rails.root}/#{ZT_CONFIG['debug']['path']}"
end

# Debug Logging: Create a log-file
if ZT_DEBUG == true && !ZT_LOG_FILE.nil?
  File.open(ZT_LOG_FILE, 'w') { |file| file.puts "Starting debug log..."}
end

##### Plant model: non-attribute parameters   #####
ZT_PLANT_COLORS = ZT_CONFIG['color_list'].sort{ |x, y| x[0] <=> y[0]}
ZT_SUNLIGHTS    = ZT_CONFIG['sunlight_list']
ZT_SOILS        = ZT_CONFIG['soil_list']
ZT_SOIL_PH      = ZT_CONFIG['soil_ph_list']

##### Mail  #####
MAIL_BCC = ZT_CONFIG['mail']['bcc']

##### Multilingual Mode #####
MULTILINGUAL = ZT_CONFIG['multilingual']['status']

#if MULTILINGUAL
#  Rails.application.config.i18n.available_locales = %w(en ru)
#  Rails.application.config.i18n.default_locale    = :en
#  Rails.application.config.i18n.load_path        += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]  # YAML Multiple structure
#else
#  Rails.application.config.i18n.default_locale    = :en
#  Rails.application.config.i18n.load_path        += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]  # YAML Multiple structure
#  Rails.application.config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
#end