FactoryGirl.define do
  factory :person do
    sequence(:first_name)   { |n| "Person #{n}" }
    last_name     "Futureworkz" 
    dob           "1990/06/04"
    gender        :male
  end

  factory :male, parent: :person do
    gender        :male
  end

  factory :female, parent: :person do
    gender        :female
  end
end
