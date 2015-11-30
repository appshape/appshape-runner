module Condition
  class Contain < Condition::Base
    def compare(value, other_value)
      if isArray?(value)
        value.map(&:to_s).include?(other_value.to_s)
      else
        value.to_s.include?(other_value.to_s)
      end
    end
  end
end