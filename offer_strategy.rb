class OfferStrategy
  def applies_to?(product_code)
    false
  end

  def apply(price, quantity)
    price * quantity
  end
end