require_relative '../test_helper'

describe Condition::Empty do
  describe 'Condition::Contain.compare' do
    it 'compares correctly' do
      Condition::Empty.new.compare(nil).must_equal true
      Condition::Empty.new.compare([]).must_equal true
      Condition::Empty.new.compare('').must_equal true
      Condition::Empty.new.compare('  ').must_equal true
      Condition::Empty.new.compare(12).must_equal false
      Condition::Empty.new.compare([12]).must_equal false
      Condition::Empty.new.compare('test').must_equal false
    end
  end
end