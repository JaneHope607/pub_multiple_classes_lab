class Customer

    attr_reader :name, :wallet, :age, :drunkenness

    def initialize(name, wallet, age, drunkenness)
        @name = name
        @wallet = wallet
        @age = age
        @drunkenness = drunkenness
    end

    def remove_money(drink)
        @wallet -= drink.price
    end

    def increase_drunkenness(drink)
        @drunkenness += drink.alcohol_level
    end

    def eat_food(food)
        @drunkenness -= food.rejuvenation_level
    end

end