require 'test_helper'

class ChoreTest < ActiveSupport::TestCase

  def setup
    @chore = Chore.new
  end


  test "invalid chore" do
    assert @chore.invalid?, "empty chore should be considered invalid"
  end

  test "empty to valid chore" do
    assert @chore.invalid?, "empty chore should be considered invalid"

    assert_equal 2, @chore.errors.count # name and complete by errors

    @chore.name = "clean room"
    assert @chore.invalid?
    assert_equal 1, @chore.errors.count # complete by error

    @chore.complete_by = Time.now
    assert @chore.valid?

  end

  test "valid chore" do
    chore = chores(:cleanroom)
    assert chore.valid?
  end

  test "if chore done?" do

    chore = Chore.new
    chore.completed = false

    assert_equal "No", chore.done

    chore.completed = true
    assert_equal "Yes", chore.done

  end


end
