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

    describe "more than two files per user" do
      let (:user) { create(:user) }
      it "fails" do
        assert_raise Mongoid::Errors::Validations do
          p = user.print_works.create file: File.open('README.rdoc')
          p.save!
          p = user.print_works.create file: File.open('README.rdoc')
          p.save!
          p = user.print_works.create file: File.open('README.rdoc')
          p.save!
        end
      end
    end
  end
end
