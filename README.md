# Acme Widget
This is a proof of concept for Acme Widget Co’s sales system, written in Ruby.

## Key Design Decisions
- **Separation of concerns**  
  - `Basket` → orchestrates items, totals  
  - `DeliveryRule` / `DeliveryCalculator` → delivery charges  
  - `OfferStrategy` (Strategy pattern) → extensible offers  
  - `Product` → product catalogue entries  
- **Dependency injection**  
  - `Basket` takes `catalogue`, `delivery_calculator`, and `offers` at initialization.  
- **Extensibility**  
  - New offers can be added by subclassing `OfferStrategy`.  
  - Delivery rules can be extended by adding `DeliveryRule` instances.  
- **Strategy Pattern**  
  - Delivery and offers are separate interchangeable strategies.  

## Running
```bash
ruby main.rb
```

### Output
```
B01, G01 => $37.85
R01, R01 => $54.37
R01, G01 => $60.85
B01, B01, R01, R01, R01 => $98.27