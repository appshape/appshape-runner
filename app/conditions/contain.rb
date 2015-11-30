module Condition
  class Contain < Condition::Base
    def compare(value, other_value)
      value.to_s.include?(other_value.to_s)
    end
  end
end