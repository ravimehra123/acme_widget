class DeliveryCalculator
  def initialize(rules)
    @rules = rules.sort_by(&:threshold)
  end

  def calculate(subtotal)
    rule = @rules.find { |rule| rule.applicable?(subtotal) }
    rule ? rule.charge : 0.0
  end
end