require_relative '../test_helper'

describe Condition::NotContain do
  describe 'Condition::NotContain.compare' do
    it 'compares correctly' do
      Condition::NotContain.new.compare([1,2,3], 1).must_equal false
      Condition::NotContain.new.compare([1,2,3], '1').must_equal false
      Condition::NotContain.new.compare([1,2,3], 5).must_equal true
      Condition::NotContain.new.compare('some text', 'some').must_equal false
      Condition::NotContain.new.compare('Some text', 'some').must_equal true
      Condition::NotContain.new.compare('some text', 'other').must_equal true
    end
  end
end