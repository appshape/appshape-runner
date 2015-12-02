module Condition
  class GreaterThanOrEqual < Condition::Base
    def compare(value, other_value)
      return false unless isNumeric?(value) && isNumeric?(other_value)

      toNumeric(value) >= toNumeric(other_value)
    end
  end
end