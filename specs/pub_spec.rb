require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')

class PubTest < MiniTest::Test

    def setup()
        @bar = ["Guinness", "Corona", "Wine", "Jack Daniels" "Strongbow"]
        @pub = Pub.new("Three Broomsticks", 1000, @bar)
    end

    def test_check_name()
        assert_equal("Three Broomsticks", @pub.name)
    end

end