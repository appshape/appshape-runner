module Condition
  class Equal < Condition::Base
    def compare(value, other_value)
      value.to_s == other_value.to_s
    end
  end
end