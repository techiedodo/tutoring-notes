require 'faker'

#Create Tutors
5.times do
  tutor = Tutor.new(
    name: Faker::Team.name,
    subjects: Faker::Lorem.words(4),
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  tutor.skip_confirmation!
  tutor.save!
end
tutors = Tutor.all

#Create Students
30.times do
  Student.create!(
    tutor: tutors.sample,
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
tutoring = TutSession.all

#Create Notes
500.times do
  Note.create!(
  tut_session: tutoring.sample,
  summary: Faker::Hipster.paragraph,
  achievement: Faker::Hipster.paragraph,
  next_sess: Faker::Hipster.paragraph,
  recommendation: Faker::Hipster.paragraph,
  trip_dist: Faker::Number.between(1, 20),
  rate: Faker::Number.between(45, 55),
  add_rate: Faker::Number.between(1, 5),
  t_start: Faker::Time.backward(1, :morning),
  t_finish: Faker::Time.forward(1, :morning),
  sess_date: Faker::Time.between(DateTime.now - 3, DateTime.now)
  )
end


tutor = Tutor.first
tutor.skip_reconfirmation!
tutor.update_attributes!(
  name: 'Luis Gaytan',
  email: 'gaytan_luis@msn.com',
  password: 'helloworld'
)

puts "Seed Finished"
puts "#{Tutor.count} tutors created"
puts "#{Student.count} students created"
puts "#{TutSession.count} sessions created"
puts "#{Note.count} notes created"
