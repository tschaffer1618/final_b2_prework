require 'rails_helper'

describe 'Course Show Page' do
  before(:each) do
    @student_1 = Student.create!(name: 'Leslie Knope')
    @student_2 = Student.create!(name: 'Michael Scott')
    @student_3 = Student.create!(name: 'Jason Bourne')
    @student_4 = Student.create!(name: 'Frodo')

    @course_1 = Course.create!(name: 'Community Engagement')

    @student_course_1 = @student_1.student_courses.create!(course: @course_1, grade: 81.6)
    @student_course_2 = @student_2.student_courses.create!(course: @course_1, grade: 56.9)
    @student_course_3 = @student_3.student_courses.create!(course: @course_1, grade: 97.3)
    @student_course_4 = @student_4.student_courses.create!(course: @course_1, grade: 89.9)
  end

  it 'lists the students in the course by grade' do
    visit course_path(@course_1)

    expect(page).to have_content(@course_1.name)

    expect(@student_3.name).to appear_before(@student_4.name)
    expect(@student_4.name).to appear_before(@student_1.name)
    expect(@student_1.name).to appear_before(@student_2.name)
  end
end
