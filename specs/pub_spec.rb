require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')
require_relative('../customer')

class PubTest < MiniTest::Test

    def setup()
        @drink1 = Drink.new("Guinness", 5)
        @drink2 = Drink.new("Corona", 4)
        @drink3 = Drink.new("Jack Daniels", 2)
        @drink4 = Drink.new("Strongbow", 3)
        @bar = [@drink1, @drink2, @drink3, @drink4]
        @pub = Pub.new("Three Broomsticks", 1000, @bar)
        @customer1 = Customer.new("John", 20, 35)
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
        @customer1.buy_drink_from_pub(@pub, @drink1)
        assert_equal(15, @customer1.wallet)
        assert_equal(1005, @pub.till)
    end

end