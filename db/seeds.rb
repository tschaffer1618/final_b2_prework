# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StudentCourse.destroy_all
Course.destroy_all
Student.destroy_all

student_1 = Student.create!(name: 'Leslie Knope')
student_2 = Student.create!(name: 'Michael Scott')
student_3 = Student.create!(name: 'Jason Bourne')
student_4 = Student.create!(name: 'Frodo')

course_1 = Course.create!(name: 'Community Engagement')
course_2 = Course.create!(name: 'Parks Management')

student_course_1 = student_1.student_courses.create!(course: course_1, grade: 81.6)
student_course_2 = student_2.student_courses.create!(course: course_1, grade: 56.9)
student_course_3 = student_3.student_courses.create!(course: course_1, grade: 97.3)
student_course_4 = student_4.student_courses.create!(course: course_1, grade: 89.9)

student_course_5 = student_1.student_courses.create!(course: course_2, grade: 93.9)
student_course_6 = student_3.student_courses.create!(course: course_2, grade: 81.1)
