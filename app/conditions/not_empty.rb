module Condition
  class NotEmpty < Condition::Base
    def compare(value, _ = nil)
      !Condition::Empty.new.compare(value, nil)
    end
  end
end