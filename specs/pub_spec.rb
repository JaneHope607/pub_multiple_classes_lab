require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class PubTest < MiniTest::Test

    def setup()
        @drink1 = Drink.new("Guinness", 5, 2)
        @drink2 = Drink.new("Corona", 4, 1)
        @drink3 = Drink.new("Jack Daniels", 2, 4)
        @drink4 = Drink.new("Strongbow", 3, 3)
        @bar = [ {
                type: @drink1,
                stock: 5 },
                {
                type: @drink2,
                stock: 10 },
                {
                type: @drink3,
                stock: 15 },
                {
                type: @drink4,
                stock: 20 }
            ]
        @pub = Pub.new("Three Broomsticks", 1000, @bar)
        @customer1 = Customer.new("John", 20, 35, 0)
        @customer2 = Customer.new("Bob", 55, 16, 0)
        @customer3 = Customer.new("Lucy", 30, 25, 6)
    end

    def test_check_name()
        assert_equal("Three Broomsticks", @pub.name)
    end

    def test_check_till()
        assert_equal(1000, @pub.till)
    end

    def test_drinks()
        assert_equal(@bar, @pub.drinks)
    end

    def test_drink_is_in_drinks()
        drink = @pub.check_drink("Guinness")
        assert_equal(true, drink)
    end

    def test_drink_is_not_in_drinks()
        drink = @pub.check_drink("vodka")
        assert_equal(false, drink)
    end

    def test_add_money_to_till()
        @pub.add_money_to_till(@drink1)
        assert_equal(1005, @pub.till)
    end
    

    def test_customer_can_buy_drink()
        @pub.buy_drink_from_pub(@customer1, @drink1)
        assert_equal(15, @customer1.wallet)
        assert_equal(1005, @pub.till)
        assert_equal(2, @customer1.drunkenness())
    end

    def test_customer_cannot_buy_drink_no_drink()
        drink = Drink.new("Glenlivet", 4, 3)
        @pub.buy_drink_from_pub(@customer1, drink)
        assert_equal(20, @customer1.wallet)
        assert_equal(1000, @pub.till)
        assert_equal(0, @customer1.drunkenness())
    end

    def test_customer_cannot_buy_drink_underage()
        @pub.buy_drink_from_pub(@customer2, @drink2)
        assert_equal(55, @customer2.wallet)
        assert_equal(1000, @pub.till)
        assert_equal(0, @customer2.drunkenness())
    end

    def test_customer_cannot_buy_drink_too_drunk()
        @pub.buy_drink_from_pub(@customer3, @drink3)
        assert_equal(30, @customer3.wallet)
        assert_equal(1000, @pub.till)
        assert_equal(6, @customer3.drunkenness)
    end

    def test_is_customer_legal_age_true()
        assert_equal(true, @pub.customer_legal_age(@customer1))
    end

    def test_is_customer_legal_age_false()
        assert_equal(false, @pub.customer_legal_age(@customer2))
    end

    def test_how_many_drinks()
        assert_equal(50, @pub.count_all_stock(@bar))
    end

end