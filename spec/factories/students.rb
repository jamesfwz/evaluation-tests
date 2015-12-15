FactoryGirl.define do
  factory :student, parent: :user, class: Student do
    sequence(:name)   { |n| "Student #{n}"}
  end
end
