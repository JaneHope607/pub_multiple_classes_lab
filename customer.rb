class Customer

    attr_reader :name, :wallet

    def initialize(name, wallet)
        @name = name
        @wallet = wallet
    end

    def remove_money(drink)
        @wallet -= drink.price
    end

    def buy_drink_from_pub(pub, drink_name)
            pub.add_money_to_till(drink_name)
            remove_money(drink_name)
    end

    

end