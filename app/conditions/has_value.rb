module Condition
  class HasValue < Condition::Base
    def compare(value, other_value)
      if isHash?(value)
        value.values.map(&:to_s).include?(other_value.to_s)
      elsif isArray?(value)
        value.map(&:to_s).include?(value.to_s)
      else
        false
      end
    end
  end
end