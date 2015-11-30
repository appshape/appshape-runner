module Condition
  class NotEqual < Condition::Base
    def compare(value, other_value)
      !Condition::Equal.new.compare(value, other_value)
    end
  end
end