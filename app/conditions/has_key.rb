module Condition
  class HasKey < Condition::Base
    def compare(value, other_value)
      return false unless isHash?(value)

      value.key?(other_value)
    end
  end
end