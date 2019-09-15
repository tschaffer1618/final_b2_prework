require 'rails_helper'

describe 'Student Show Page' do
  before(:each) do
    @student_1 = Student.create!(name: 'Leslie Knope')

    @course_1 = Course.create!(name: 'Parks Management')
    @course_2 = Course.create!(name: 'Community Engagement')

    @student_course_1 = @student_1.student_courses.create!(course: @course_1, grade: 81.6)
    @student_course_2 = @student_1.student_courses.create!(course: @course_2, grade: 89.9)
  end

  it 'displays pertinent info about the student' do
    visit student_path(@student_1)

    expect(page).to have_content(@student_1.name)

    within "#course-#{@course_1.id}" do
      expect(page).to have_content(@course_1.name)
      expect(page).to have_content("Grade: #{@student_course_1.grade}%")
    end

    within "#course-#{@course_2.id}" do
      expect(page).to have_content(@course_2.name)
      expect(page).to have_content("Grade: #{@student_course_2.grade}%")
    end
  end
end
