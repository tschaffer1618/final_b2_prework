class Course < ApplicationRecord
  validates_presence_of :name

  has_many :student_courses
  has_many :students, through: :student_courses

  def sort_students_by_grade
    students.joins(:student_courses)
            .select("students.name, student_courses.grade")
            .order("student_courses.grade desc")
            .distinct
  end
end
