module Condition
  class NotContain < Condition::Base
    def compare(value, other_value)
      !Condition::Contain.new(value, other_value)
    end
  end
end