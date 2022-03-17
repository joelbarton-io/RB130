require 'minitest/autorun'
require 'minitest/reporters'
MiniTest::Reporters.use!

class Employee
  def hire
    raise("NoExperienceError")
  end
end

class ExperienceErrorTest < MiniTest::Test
  def set_up
    @employee = Employee.new
  end

  def test_hire
    assert_raises("NoExperienceError") { @employee.hire }
  end
end
