# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Lounge.create!(:id => 1, :name => "Bucketlist", :description => "Things you have to do around Berkeley before you graduate.")
Lounge.create!(:id => 2, :name => "Random", :description => "Share whatever you want")
User.create!(:id => 1, :name => "Michelle Chow", :username => "callmemc", :email => "callmemc@gmail.com", :password => "21326241", :password_confirmation => "21326241")