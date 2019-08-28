require 'pry'
class CashRegister

    attr_accessor :total, :discount

    

    def initialize(discount = 0)
        @total = 0     
        
        @discount = discount
        @cart = []
        @last_sale = 0
    end


    def add_item(title, price, quantity = 1)
        quantity.times {@cart << {title => [price]}}
        @total += price * quantity
        @last_sale = price * quantity

    end

    def apply_discount
        message = ""
        if @discount == 0
            message = "There is no discount to apply." 
        else
        @total = (@total * (100 - discount))/100
        message = "After the discount, the total comes to $#{@total}."
        end
        message
        
    end

    def items
        
         item_array = []
        @cart.each do |hash|
           #puts hash.keys
            item_array.append(hash.keys) 
        end
        item_array.flatten
    end

    def void_last_transaction
        @total -= @last_sale
        @total
    end


end
#binding.pry