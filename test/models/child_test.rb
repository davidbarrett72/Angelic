require 'test_helper'

class ChildTest < ActiveSupport::TestCase


  test "invalid child" do
    child = Child.new
    assert child.invalid?
  end

  test "valid child" do
    child = children(:buster)

    child.errors.each do |e|
      puts e
    end

    assert child.valid?
  end

  test "to string" do
    assert_equal "Buster, Brown", children(:buster).to_s
  end

  test "invalid age" do
    child = children(:buster)

    child.age = 999  # not a valid age
    assert child.invalid?
  end


  test "current earned" do
    chores = []

    child = children(:buster)

    c = Chore.new
    c.completed = false
    chores << c

    c = Chore.new
    c.completed = true
    chores << c

    assert_equal 10.00, child.current_earned(chores)


  end



  test "current earned with no chores complete" do

    child = children(:buster)

    chores = []

    assert_equal 0.00, child.current_earned(chores)


  end

end
