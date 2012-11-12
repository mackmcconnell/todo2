# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

List.create(:title => "Around the house")
List.create(:title => "At school")

Task.create( :description => "Walk the dog", :list_id => 1)
Task.create( :description => "Brush teeth", :list_id => 1)


Task.create( :description => "Flirt with TA", :list_id => 2)
Task.create( :description => "Do yesterdays HW", :list_id => 2)