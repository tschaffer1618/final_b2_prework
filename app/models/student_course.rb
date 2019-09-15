class StudentCourse < ApplicationRecord
  validates :grade, numericality: {greater_than_or_equal_to: 0}

  belongs_to :student
  belongs_to :course
end
