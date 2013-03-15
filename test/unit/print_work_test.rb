require 'test_helper'

class PrintWorkTest < ActiveSupport::TestCase
  test "print_work attributes must not be empty" do
    print_work = PrintWork.new

    assert print_work.invalid?
    assert_present print_work.errors[:file]
  end

  test "new print work should have state set to ready" do
    print_work = PrintWork.new
    print_work.file = "pepe"

    print_work.save

    assert print_work.valid?
    assert_equal "queued", print_work.state
  end
end
