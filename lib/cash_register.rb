require "pry"
class CashRegister

    attr_accessor :total, :discount, :cart, :last_transaction
    
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity = 1)
        quantity.times do
            @cart << title
        end
        # counter = 0 
        # while counter < quantity
        #     @cart << title
        #     counter += 1
        # end 
        self.last_transaction = price * quantity
        @total += self.last_transaction  
    end 

    def apply_discount
        #   binding.pry
        if self.discount == 0
            "There is no discount to apply."
        else
            @total = self.total * (1-(self.discount/100.0))
            "After the discount, the total comes to $#{@total.to_i}."
        end
        
    end

    def items
        #return an array of all items that have been added.
        @cart
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end

#  cash_20= CashRegister.new(20)
#  cash_0= CashRegister.new
#  cash_50= CashRegister.new(50)

#  binding.pry
