FactoryGirl.define do
  factory :school do
    sequence(:name)   { |n| "School #{n}"}
    type :university
  end
end
