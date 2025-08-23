class DeliveryRule
  attr_reader :threshold

  def initialize(threshold:, charge:)
    @threshold = threshold
    @charge = charge
  end

  def applicable?(subtotal)
    subtotal < @threshold
  end

  def charge
    @charge
  end
end