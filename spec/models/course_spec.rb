require 'rails_helper'

describe Course do
  describe 'relationships' do
    it {should have_many(:student_courses) }
    it {should have_many(:students).through(:student_courses) }
  end

  describe 'validations' do
    it {should validate_presence_of(:name) }
  end

  describe 'instance methods' do
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

    it 'sort_students_by_grade' do
      expected = [@student_3.name, @student_4.name, @student_1.name, @student_2.name]
      expect(@course_1.sort_students_by_grade.map { |student| student.name }).to eq(expected)
    end
  end
end
