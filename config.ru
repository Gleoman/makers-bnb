require './app/app'
ENV['RACK-ENV'] ||= "development"
# ENV['LC-LOGIN'] = 'teddy_goold@hotmail.com'
# ENV['lC-API'] = '9c390b1bb83987975b29f930e316be7d'
run DwellBNB
