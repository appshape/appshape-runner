module Condition
  class Empty < Condition::Base
    def compare(value, _ = nil)
      return true if value.nil?
      return value.empty? if value.respond_to?(:empty?) && !value.is_a?(String)
      return value.to_s.gsub(/\s+/, '').empty?
    end
  end
end