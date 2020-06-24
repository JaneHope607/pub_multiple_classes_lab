require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food')

class FoodTest < MiniTest::Test

    def setup()
        @food = Food.new("chips", 5, 1)
    end

    def test_check_name()
        assert_equal("chips", @food.name)
    end

    def test_check_price()
        assert_equal(5, @food.price)
    end

end