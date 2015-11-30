class ConditionFactory
  def self.get(condition_code)
    "Condition::#{condition_code.camelize}".constantize.new
  end
end