require 'faker'

#Create Students
30.times do
  Student.create!(
    name: Faker::GameOfThrones.character,
    bio: Faker::Hipster.paragraph
  )
end
student = Student.all

#Create Sessions
300.times do
  TutSession.create!(
    student: student.sample,
    session_name: Faker::Company.duns_number
  )
end

puts "Seed Finished"
puts "#{Student.count} students created"
puts "#{TutSession.count} sessions created"
