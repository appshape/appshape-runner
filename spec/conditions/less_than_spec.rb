require_relative '../test_helper'

describe Condition::LessThan do
  describe 'Condition::LessThan.compare' do
    it 'compares correctly' do
      Condition::LessThan.new.compare(2, 5).must_equal true
      Condition::LessThan.new.compare('2', '5').must_equal true
      Condition::LessThan.new.compare('0.8', '12.4').must_equal true
      Condition::LessThan.new.compare('3', [1,2,3]).must_equal false
    end
  end
end