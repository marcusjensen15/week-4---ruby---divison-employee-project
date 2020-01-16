# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#this seeder works

50.times do |index|

  Division.create!(name: Faker::Food.spice)
end

p "Created #{Division.count} divisions"



Employee.destroy_all



50.times do |index|

  Employee.create!(employee_name: Faker::Food.spice,
                        division_id: rand(50))
end

p "Created #{Employee.count} employees"


50.times do |index|

  Project.create!(project_name: Faker::Food.spice)
end

p "Created #{Project.count} Projects"
