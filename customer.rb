class Customer

    attr_reader :name, :wallet, :age

    def initialize(name, wallet, age)
        @name = name
        @wallet = wallet
        @age = age
    end

    def remove_money(drink)
        @wallet -= drink.price
    end

    def buy_drink_from_pub(pub, drink_name)
        if (pub.check_drink(drink_name.name) && customer_legal_age())
            pub.add_money_to_till(drink_name)
            remove_money(drink_name)
        end
    end

    def customer_legal_age()
        return true if (@age >= 18)
        return false
    end

    

end