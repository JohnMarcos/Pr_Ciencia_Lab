# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'

Enrollment.destroy_all
Comment.destroy_all
Lesson.destroy_all
Course.destroy_all
User.destroy_all

puts 'Creando 20 usuarios student o teacher...'

20.times do
  User.create!(
    email: Faker::Internet.email(name: 'Nancy'),
    password: Faker::Internet.password(min_length: 8),
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    profile: ["student", "teacher"].sample
  )
end

puts 'Creando 10 courses...'

10.times do
  Course.create!(
    name: Faker::Educator.course_name,
    description: Faker::Educator.subject,
    user_id: User.all.select { |user| user.profile == "teacher" }.sample.id
  )
end

puts 'Creando 100 lessons...'

100.times do
  Lesson.create!(
    name: Faker::Lorem.paragraph(sentence_count: 1),
    description: Faker::Lorem.sentence(word_count: 600, supplemental: true, random_words_to_add:200),
    course_id: Course.all.sample.id
  )
end

puts 'Creando 200 comments...'

200.times do
  Comment.create!(
    comment: Faker::Lorem.sentence(word_count: 5, supplemental: true, random_words_to_add:2),
    user_id: User.all.select { |user| user.profile == "student" }.sample.id,
    lesson_id: Lesson.all.sample.id
  )
end

puts 'Creando 10 enrollment...'

10.times do
  Enrollment.create!(
    user_id: User.all.select { |user| user.profile == "student" }.sample.id,
    course_id: Course.all.sample.id
  )
end

puts 'Creando cuenta John Videla...'

john = User.create!(email: 'john.marcos.videla.r@gmail.com', password: '123456', first_name: 'John', last_name: 'Videla', profile: 'student')
Enrollment.create!(user_id: john.id, course_id: Course.all.sample.id)
Enrollment.create!(user_id: john.id, course_id: Course.all.sample.id)
Enrollment.create!(user_id: john.id, course_id: Course.all.sample.id)
Enrollment.all.select { |enrollment| enrollment.user_id == john.id }.each do |enrollment|
  enrollment.lessons.each do |lesson|
  lesson.id
  end
end
Comment.create!(user_id: john.id, lesson_id: Enrollment.all.select { |enrollment| enrollment.user_id == john.id }, comment: 'Muy bueno el curso')

puts '!Finalizado¡'