require_relative "offer_strategy"

class RedWidgetOffer < OfferStrategy
  def applies_to?(product_code)
    product_code == "R01"
  end

  def apply(price, quantity)
    pairs = quantity / 2
    remainder = quantity % 2
    pairs * (price + price / 2.0) + remainder * price
  end
end