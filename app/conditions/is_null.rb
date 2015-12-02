module Condition
  class IsNull < Condition::Base
    def compare(value, _ = nil)
      value.nil?
    end
  end
end