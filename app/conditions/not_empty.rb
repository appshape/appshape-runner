module Condition
  class NotEmpty < Condition::Base
    def compare(value, other_value)
      !Condition::Empty.new.compare(value, other_value)
    end
  end
end