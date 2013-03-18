# This will guess the User class
FactoryGirl.define do
  factory :print_work do
    file File.open('Gemfile')
  end
end

FactoryGirl.define do
  factory :user do
    email "pepe@gmail.com"
    password "12345678"
  end
end