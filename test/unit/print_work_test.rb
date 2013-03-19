require 'test_helper'

class PrintWorkTest < ActiveSupport::TestCase
  setup do
    @print_work = FactoryGirl.build(:print_work)
  end

  test "print_work attributes must not be empty" do
    print_work = PrintWork.new

    assert print_work.invalid?
    assert_present print_work.errors[:file]
  end

  test "new print work should have state set to queued" do
    @print_work.save

    assert @print_work.valid?
    assert_equal "queued", @print_work.state
  end

  test "getters of state should return valid states" do
    assert_equal "queued", @print_work.state
    assert @print_work.queued?

    @print_work.ready
    assert_equal "ready", @print_work.state
    assert @print_work.ready?

    @print_work.cancel
    assert_equal "cancelled", @print_work.state
    assert @print_work.cancelled?
  end
end
