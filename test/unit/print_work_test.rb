require 'test_helper'

class PrintWorkTest < ActiveSupport::TestCase
  test "print_work attributes must not be empty" do
    print_work = PrintWork.new

    assert print_work.invalid?
    assert_present print_work.errors[:file]
    assert_present print_work.errors[:state]
  end
end
