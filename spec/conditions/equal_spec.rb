require_relative '../test_helper'

describe Condition::Equal do
  describe 'Condition::Equal.compare' do
    it 'compares correctly' do
      Condition::Equal.new.compare(1, 1).must_equal true
      Condition::Equal.new.compare(1, 2).must_equal false
      Condition::Equal.new.compare([1,2], [1,2]).must_equal true
      Condition::Equal.new.compare([1,2], [2,1]).must_equal false
    end
  end
end