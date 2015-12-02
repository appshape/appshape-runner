require_relative '../test_helper'

describe Condition::NotEmpty do
  describe 'Condition::NotEmpty.compare' do
    it 'compares correctly' do
      Condition::NotEmpty.new.compare(nil).must_equal false
      Condition::NotEmpty.new.compare([]).must_equal false
      Condition::NotEmpty.new.compare('').must_equal false
      Condition::NotEmpty.new.compare('  ').must_equal false
      Condition::NotEmpty.new.compare(12).must_equal true
      Condition::NotEmpty.new.compare([12]).must_equal true
      Condition::NotEmpty.new.compare('test').must_equal true
    end
  end
end