require_relative '../test_helper'

describe Condition::HasValue do
  describe 'Condition::HasValue.compare' do
    it 'compares correctly' do
      Condition::HasValue.new.compare({ 'test' => 'test' }, 'test').must_equal true
      Condition::HasValue.new.compare({ 'test' => ['test1','test2']}, 'test1').must_equal true
      Condition::HasValue.new.compare(['test'], 'test').must_equal true
      Condition::HasValue.new.compare(['test', ['nested_test']], 'nested_test').must_equal true
    end
  end
end