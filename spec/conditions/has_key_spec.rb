require_relative '../test_helper'

describe Condition::HasKey do
  describe 'Condition::HasKey.compare' do
    it 'compares correctly' do
      Condition::HasKey.new.compare({'test' => 'test'}, 'test').must_equal true
      Condition::HasKey.new.compare(nil, 'test').must_equal false
      Condition::HasKey.new.compare([], 'test').must_equal false
      Condition::HasKey.new.compare('5', 'test').must_equal false
    end
  end
end