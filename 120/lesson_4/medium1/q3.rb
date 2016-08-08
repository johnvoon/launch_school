class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

# we could change attr_reader to attr_accessor and change quantity to self.quantity. 
# but you are altering the public interfaces of the class. You are now allowing clients of the class to change the quantity directly (calling the accessor with the `instance.quantity = <new value>` notation) rather than by going through the `update_quantity` method. Therefore protections built into the `update_quantity` method can be circumvented and potentially pose problems down the line.