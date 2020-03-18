require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bus_stop.rb")
require_relative("../person")
require_relative("../bus")

class BusStopTest < MiniTest::Test

  def setup()
  @bus_stop = BusStop.new("bus stop")
  @person1 = Person.new("Alex", 27)
  @person2 = Person.new("Chris", 59)
  @person3 = Person.new("Antonio", 15)
  @bus = Bus.new(23, "city centre")

  end

  def test_check_name()
    assert_equal("bus stop", @bus_stop.name())
  end

  def test_adds_person_to_queue()
    @bus_stop.add_person_to_queue(@person1)
    assert_equal(1, @bus_stop.queue.length())
  end

  def test_empty_queue()
    @bus_stop.add_person_to_queue(@person1)
    @bus_stop.add_person_to_queue(@person1)
    assert_equal(0, @bus_stop.empty_queue())
  end


  def test_pick_up_from_stop()
    @bus_stop.add_person_to_queue(@person1)
    @bus_stop.add_person_to_queue(@person1)

      full_queue = @bus_stop.queue()
      empty_queue()
      @bus.pick_up_passenger(full_queue)
      assert_equal(0 queue of the bus)
      assert_equal(2, lenght of the passenger list of the bus)


  end
end
