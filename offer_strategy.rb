class OfferStrategy
  def applies_to?(product_code)
    false
  end

  def apply(price, qty)
    price * qty
  end
end