require 'test_helper'

describe PrintWork do
  describe "save!" do
    let (:print_work) { build(:print_work) }
     
    describe "when does not have a file" do
      let (:print_work) { build(:print_work, file: nil) }
      it "fails" do
        print_work.wont_be :valid?
      end
    end

    describe "when has a file" do
      it "succeds" do
        print_work.must_be :valid?      
      end
    end

    describe "only accepts two files per user" do
      let (:user) { build(:user) }
      it "fails" do
        skip "TO-DO: push diferent print_works objects"
        user.print_works << print_work
      end
    end
  end
end
