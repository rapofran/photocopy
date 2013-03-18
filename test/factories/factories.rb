# This will guess the User class
FactoryGirl.define do
  factory :print_work do
    file File.open('Gemfile')
  end
end