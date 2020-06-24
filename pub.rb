class Pub

    attr_reader :name, :till, :drinks

    def initialize(name, till, drinks)
        @name = name
        @till = till
        @drinks = drinks
    end

    def check_drink(drink_name)
        for drink in drinks
            return true if drink_name == drink.name
        end
        return false
    end

    def add_money_to_till(drink_name)
        return @till += drink_name.price
    end

    def buy_drink_from_pub(customer, drink_name)
        if (check_drink(drink_name.name) && customer_legal_age(customer))
            add_money_to_till(drink_name)
            customer.remove_money(drink_name)
        end
    end

    def customer_legal_age(customer)
        return true if (customer.age >= 18)
        return false
    end

end