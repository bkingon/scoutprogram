# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
admin_credentials = [
  {:email => 'bkingon@gmail.com', :password => 'password', :password_confirmation => 'password'},
]

AdminUser.destroy_all
admin_credentials.each do |details|
  AdminUser.create!(details)
end
AdminUser.last.add_role "supreme_admin"


