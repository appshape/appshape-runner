module Condition
  class Empty < Condition::Base
    def compare(value, _)
      value.nil? || value.to_s.empty?
    end
  end
end