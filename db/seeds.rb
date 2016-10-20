require 'faker'

#Create Students
30.times do
  Student.create!(
    name: Faker::GameOfThrones.character,
    bio: Faker::Hipster.paragraph
  )
end

puts "Seed Finished"
puts "#{Student.count} students created"
