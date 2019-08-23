class CashRegister
  attr_accessor :total, :items, :last_item_data
  attr_reader :discount
  
  def initialize(discount=nil)
    @total=0
    @discount=discount
    @items=[]
  end
  
  def add_item(title,price,quantity=1)
    self.total+=price*quantity
    self.last_item_data=[price,quantity]
    quantity.times {self.items.push(title)}
  end
  
  def apply_discount
    if discount
      self.total*=((100-discount)*0.01)
      #might need to address the to_integer below
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total-=(@last_item_data[0]*@last_item_data[1])
    @last_item_data[1].times {@items.delete_at(-1)}
    
  end
  
end

