# Setup catalogue
require_relative "product"
require_relative "delivery_rule"

catalogue = {
  "R01" => Product.new(code: "R01", name: "Red Widget", price: 32.95),
  "G01" => Product.new(code: "G01", name: "Green Widget", price: 24.95),
  "B01" => Product.new(code: "B01", name: "Blue Widget", price: 7.95)
}

# Setup delivery rules
rules = [
  DeliveryRule.new(threshold: 50, charge: 4.95),
  DeliveryRule.new(threshold: 90, charge: 2.95)
]
delivery_calculator = DeliveryCalculator.new(rules)