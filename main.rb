# Setup catalogue
require_relative "product"
require_relative "delivery_rule"
require_relative "basket"
require_relative "red_widget_offer"
require_relative "delivery_calculator"

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

# Setup offers
offers = [RedWidgetOffer.new]

def run_example(items, basket)
  items.each { |code| basket.add(code) }
  puts "#{items.join(', ')} => #{basket.total}"
end

# Initialize basket/cart
basket = Basket.new(catalogue: catalogue, delivery_calculator: delivery_calculator, offers: offers)
run_example(%w[B01 G01], basket) 

basket = Basket.new(catalogue: catalogue, delivery_calculator: delivery_calculator, offers: offers)
run_example(%w[R01 R01], basket)                  

basket = Basket.new(catalogue: catalogue, delivery_calculator: delivery_calculator, offers: offers)
run_example(%w[R01 G01], basket)                   

basket = Basket.new(catalogue: catalogue, delivery_calculator: delivery_calculator, offers: offers)
run_example(%w[B01 B01 R01 R01 R01], basket)      