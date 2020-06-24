class Pub

    attr_reader :name, :till, :drinks

    def initialize(name, till, drinks)
        @name = name
        @till = till
        @drinks = drinks
    end

    def check_drink(drink_name)
        for drink in drinks
            return true if drink_name == drink[:type].name
        end
        return false
    end

    def add_money_to_till(drink_name)
        return @till += drink_name.price
    end

    def buy_drink_from_pub(customer, drink_name)
        if (check_drink(drink_name.name) && customer_legal_age(customer) && customer.drunkenness <= 5)
            add_money_to_till(drink_name)
            customer.remove_money(drink_name)
            customer.increase_drunkenness(drink_name)
        end
    end

    def customer_legal_age(customer)
        return true if (customer.age >= 18)
        return false
    end

    def count_all_stock(bar)
        total = 0
        for drink in bar
            total += drink[:stock]
        end
        return total
    end

end