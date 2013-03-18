FactoryGirl.define do
  factory :print_work do
    file File.open('README.rdoc')
    description "una descripcion"
    state "ready"
  end
end