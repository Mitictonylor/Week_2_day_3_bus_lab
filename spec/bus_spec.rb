require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bus")

class BusTest < MiniTest::Test

  def setup()
    @bus = Bus.new(23, "City Centre")
  end

  def test_check_route_num()
    assert_equal(23, @bus.route_num)
  end

  def test_check_destination()
    assert_equal("City Centre", @bus.destination)
  end
end
