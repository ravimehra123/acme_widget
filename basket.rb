class Basket
  def initialize(catalogue:, delivery_calculator:, offers: [])
    @catalogue = catalogue
    @delivery_calculator = delivery_calculator
    @offers = offers
    @items = []
  end

  def add(product_code)
    raise "Unknown product code: #{product_code}" unless @catalogue.key?(product_code)
    @items << product_code
  end

  def total
    subtotal = calculate_subtotal
    delivery = @delivery_calculator.calculate(subtotal)
    final_total = subtotal + delivery
    format("$%.2f", final_total.round(2))
  end

  private

  def calculate_subtotal
    counts = @items.tally
    counts.reduce(0.0) do |sum, (code, qty)|
      price = @catalogue[code].price
      strategy = @offers.find { |o| o.applies_to?(code) }
      sum + (strategy ? strategy.apply(price, qty) : price * qty)
    end
  end
end
