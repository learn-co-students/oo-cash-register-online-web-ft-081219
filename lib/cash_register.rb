

class CashRegister 
  attr_accessor :total, :discount, :items, :last_transaction
  
    
  def initialize(discount=0)
    @total= 0
    @discount=discount
    @items=[]
    @last_transaction = 0
  end
  
  def add_item(title, price, quantity=1)
    self.last_transaction = price * quantity
      @total += self.last_transaction 
      quantity.times do
    @items << title
  end
end
  
  def apply_discount
    if @discount > 0
      self.total = self.total-(self.discount.to_f/100*self.total).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total-=self.last_transaction
  end
  
end

