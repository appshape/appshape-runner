require_relative '../test_helper'

describe Condition::IsNull do
  describe 'Condition::IsNull.compare' do
    it 'compares correctly' do
      Condition::IsNull.new.compare(nil).must_equal true
      Condition::IsNull.new.compare('').must_equal false
      Condition::IsNull.new.compare([]).must_equal false
      Condition::IsNull.new.compare({}).must_equal false
    end
  end
end