require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bus")
require_relative("../person")
require_relative("../bus_stop")

class BusTest < MiniTest::Test

  def setup()
    @bus = Bus.new(23, "City Centre")
    @passenger1 = Person.new("Chris", 26)
    @passenger2 = Person.new("alex", 27)
    @passenger3 = Person.new("antonio", 32)
    @stop1 = BusStop.new("partick")


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
    @bus.pick_up_passenger(@passenger1)
    assert_equal(1, @bus.check_how_many_passengers())
  end

  def test_drop_off()
    @bus.pick_up_passenger(@passenger1)
    @bus.pick_up_passenger(@passenger2)
    @bus.drop_off(@passenger1)
    assert_equal(1, @bus.check_how_many_passengers())
  end

  def test_all_passengers_leave()
    @bus.pick_up_passenger(@passenger1)
    @bus.pick_up_passenger(@passenger2)
    @bus.empty_bus()
    assert_equal(0, @bus.check_how_many_passengers())
  end

  def pick_up_from_bus_stop()
    @stop1.add_person_to_queue(@passenger1)
    @stop1.add_person_to_queue(@passenger2)
    @bus.pick_up_from_bus_stop(@stop1)
    assert_equal(2, @bus.check_how_many_passengers())
    assert_equal(0, @stop1.queue_lenght())
  end
end
