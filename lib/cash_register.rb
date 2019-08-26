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
        self.last_transaction = (price * quantity)
        @total += self.last_transaction
    end

    def items
        @cart
    end

    def apply_discount
        if discount == 0
            "There is no discount to apply."
        else
            @total = total * (1-(discount/100.0))
            "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end
