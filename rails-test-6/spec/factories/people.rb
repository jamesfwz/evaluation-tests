FactoryGirl.define do
  factory :person do
    sequence(:first_name)   { |n| "Person #{n}" }
    last_name     "Futureworkz" 
    dob           "1990/06/04"
    gender        :male
  end
end
