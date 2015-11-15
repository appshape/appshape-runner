require_relative '../test_helper'

describe Test do
  describe 'Test.from_json' do
    before do
      @data = { 'id' => 1, 'locations' => [], 'requests' => [] }
    end

    it 'must return new test object' do
      Test.from_json(@data).is_a?(Test).must_equal true
    end

    it 'must assign all required attributes' do
      test = Test.from_json(@data)
      test.id.must_equal @data['id']
      test.requests.length.must_equal @data['requests'].length
    end
  end
end