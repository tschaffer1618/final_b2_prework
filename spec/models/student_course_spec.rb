require 'rails_helper'

describe StudentCourse do
  describe 'relationships' do
    it {should belong_to(:student) }
    it {should belong_to(:course) }
  end

  describe 'validations' do
    it { should validate_numericality_of(:grade).is_greater_than_or_equal_to(0) }
  end
end
