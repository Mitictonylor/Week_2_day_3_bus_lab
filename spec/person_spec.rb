require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative("../person")

class PersonTest < MiniTest::Test

  def setup()
    @person = Person.new("Chris", 26)
  end

  def test_check_name()
    assert_equal("Chris", @person.name)
  end

  def test_check_age()
    assert_equal(26, @person.age)
  end

end
