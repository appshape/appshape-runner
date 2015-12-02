module Condition
  class HasValue < Condition::Base
    def compare(value, other_value)
      if isHash?(value)
        value.values.flatten.map(&:to_s).include?(other_value.to_s)
      elsif isArray?(value)
        value.flatten.map(&:to_s).include?(other_value.to_s)
      else
        false
      end
    end
  end
end