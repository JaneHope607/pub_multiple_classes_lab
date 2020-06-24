require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customer')
require_relative('../pub')
require_relative('../drink')

class CustomerTest < MiniTest::Test

    def setup()
        @customer1 = Customer.new("John", 20)
    end

    def test_check_name()
        assert_equal("John", @customer1.name)
    end

    def test_check_wallet()
        assert_equal(20, @customer1.wallet)
    end

end