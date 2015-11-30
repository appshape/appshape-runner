module Condition
  class IsNull < Condition::Base
    def compare(value, _)
      value.nil?
    end
  end
end