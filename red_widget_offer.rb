class RedWidgetOffer < OfferStrategy
  def applies_to?(product_code)
    product_code == "R01"
  end

  def apply(price, qty)
    pairs = qty / 2
    remainder = qty % 2
    pairs * (price + price / 2.0) + remainder * price
  end
end