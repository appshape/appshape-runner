module Condition
  class Base
    def toNumeric(value)
      BigDecimal.new(value)
    end

    def isNumeric?(value)
      !!Float(value) rescue false
    end

    def isHash?(value)
      value.respond_to?(:key?)
    end

    def isArray?(value)
      value.respond_to?(:include?)
    end
  end
end