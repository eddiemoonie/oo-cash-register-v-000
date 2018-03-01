class CashRegister

  attr_accessor :total, :discount, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    self.total += quantity * price
    quantity.times do
      items << title
    end
    self.last_transaction = quantity * price
  end

  def apply_discount
    if discount != 0
      self.total = (total - (total * (discount.to_f/100))).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end
