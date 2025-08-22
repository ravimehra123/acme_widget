class DeliveryCalculator
  def initialize(rules)
    @rules = rules.sort_by { |r| r.instance_variable_get(:@threshold) }
  end

  def calculate(subtotal)
    rule = @rules.find { |r| r.applicable?(subtotal) }
    rule ? rule.charge : 0.0
  end
end