require_relative '../test_helper'

describe Condition::GreaterThan do
  describe 'Condition::GreaterThan.compare' do
    it 'compares correctly' do
      Condition::GreaterThan.new.compare(5, 2).must_equal true
      Condition::GreaterThan.new.compare("5", "2").must_equal true
      Condition::GreaterThan.new.compare("12.4", "0.8").must_equal true
      Condition::GreaterThan.new.compare([1,2,3], "3").must_equal false
    end
  end
end