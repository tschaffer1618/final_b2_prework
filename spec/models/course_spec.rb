require 'rails_helper'

describe Course do
  describe 'relationships' do
    it {should have_many(:student_courses) }
    it {should have_many(:students).through(:student_courses) }
  end

  describe 'validations' do
    it {should validate_presence_of(:name) }
  end
end
