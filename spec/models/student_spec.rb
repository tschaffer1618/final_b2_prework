require 'rails_helper'

describe Student do
  describe 'relationships' do
    it {should have_many(:student_courses) }
    it {should have_many(:courses).through(:student_courses) }
  end

  describe 'validations' do
    it {should validate_presence_of(:name) }
  end
end
