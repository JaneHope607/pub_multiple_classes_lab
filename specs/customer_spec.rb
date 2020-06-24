require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../drink')

class CustomerTest < MiniTest::Test

    def setup()
        @drink1 = Drink.new("Guinness", 5)
        @drink2 = Drink.new("Corona", 4)
        @drink3 = Drink.new("Jack Daniels", 2)
        @drink4 = Drink.new("Strongbow", 3)
        @customer1 = Customer.new("John", 20, 35)
        @customer2 = Customer.new("Bob", 55, 16)
    end

    def test_check_name()
        assert_equal("John", @customer1.name)
    end

    def test_check_wallet()
        assert_equal(20, @customer1.wallet)
    end

    def test_remove_money()
        @customer1.remove_money(@drink1)
        assert_equal(15, @customer1.wallet)
    end

    def test_check_age()
        assert_equal(35, @customer1.age)
    end
    

end