require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../bus_stop.rb")
require_relative("../person")

class BusStopTest < MiniTest::Test

  def setup()
  @bus_stop = BusStop.new("bus stop")
  @person1 = Person.new("Alex", 27)
  @person2 = Person.new("Chris", 59)
  @person3 = Person.new("Antonio", 15)

  end

  def test_check_name()
    assert_equal("bus stop", @bus_stop.name())
  end

  def test_adds_person_to_queue()
    @bus_stop.add_person_to_queue(@person1)
    assert_equal(1, @bus_stop.queue.length())
  end


end
