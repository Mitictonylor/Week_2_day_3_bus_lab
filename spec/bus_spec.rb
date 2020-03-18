7f1d1ad1e6814a33f00d4cf0ee4d27ea102d4666require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bus")
require_relative("../person")

class BusTest < MiniTest::Test

  def setup()
    @bus = Bus.new(23, "City Centre")
    @person = Person.new("Chris", 26)
  end

  def test_check_route_num()
    assert_equal(23, @bus.route_num())
  end

  def test_check_destination()
    assert_equal("City Centre", @bus.destination())
  end

  def test_drive_noise()
    assert_equal("Brum brum", @bus.drive_noise())
  end

  def test_check_how_many_passengers()
    assert_equal(0, @bus.check_how_many_passengers())
  end

  def test_pick_up_passenger()
    @bus.pick_up_passenger(@person)
    assert_equal(1, @bus.check_how_many_passengers())
  end

  def test_drop_off()
    @bus.pick_up_passenger(@person)
    @bus.drop_off()
    assert_equal(0, @bus.check_how_many_passengers())
  end

  def test_all_passengers_leave()
    @bus.pick_up_passenger(@person)
    @bus.pick_up_passenger(@person)
    @bus.empty_bus()
    assert_equal(0, @bus.check_how_many_passengers())
  end


end
