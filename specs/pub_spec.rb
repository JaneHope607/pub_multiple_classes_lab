require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drink')

class PubTest < MiniTest::Test

    def setup()
        @drink1 = Drink.new("Guinness", 5)
        @drink2 = Drink.new("Corona", 4)
        @drink3 = Drink.new("Jack Daniels", 2)
        @drink4 = Drink.new("Strongbow", 3)
        @bar = [@drink1, @drink2, @drink3, @drink4]
        @pub = Pub.new("Three Broomsticks", 1000, @bar)
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
end