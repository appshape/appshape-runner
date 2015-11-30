require_relative '../test_helper'

describe Condition::Contain do
  describe 'Condition::Contain.compare' do
    it 'compares correctly' do
      Condition::Contain.new.compare([1,2,3], 1).must_equal true
      Condition::Contain.new.compare([1,2,3], '1').must_equal true
      Condition::Contain.new.compare([1,2,3], 5).must_equal false
      Condition::Contain.new.compare('some text', 'some').must_equal true
      Condition::Contain.new.compare('Some text', 'some').must_equal false
      Condition::Contain.new.compare('some text', 'other').must_equal false
    end
  end
end