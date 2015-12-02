require_relative '../test_helper'

describe Condition::NotEqual do
  describe 'Condition::NotEqual.compare' do
    it 'compares correctly' do
      Condition::NotEqual.new.compare(1, 1).must_equal false
      Condition::NotEqual.new.compare(1, 2).must_equal true
      Condition::NotEqual.new.compare([1,2], [1,2]).must_equal false
      Condition::NotEqual.new.compare([1,2], [2,1]).must_equal true
    end
  end
end