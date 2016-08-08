class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

# quantity is a local variable
# we need to disambiguate quantity as a local variable to a setter method by prepending `quantity` with `self`
# but `quantity` cannot be set because only `attr_reader` so setter method undefined
# so instead we need to prepend quantity with @
