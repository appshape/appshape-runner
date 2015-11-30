require_relative '../test_helper'

describe Condition::GreaterThanOrEqual do
  describe 'Condition::GreaterThanOrEqual.compare' do
    it 'compares correctly' do
      Condition::GreaterThanOrEqual.new.compare(5, 2).must_equal true
      Condition::GreaterThanOrEqual.new.compare(5, 5).must_equal true
      Condition::GreaterThanOrEqual.new.compare("5", "2").must_equal true
      Condition::GreaterThanOrEqual.new.compare("5", "5").must_equal true
      Condition::GreaterThanOrEqual.new.compare("12.4", "0.8").must_equal true
      Condition::GreaterThanOrEqual.new.compare("12.4", "12.4").must_equal true
      Condition::GreaterThanOrEqual.new.compare([1,2,3], "3").must_equal false
    end
  end
end