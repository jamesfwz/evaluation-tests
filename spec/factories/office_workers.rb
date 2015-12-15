FactoryGirl.define do
  factory :office_worker, parent: :user, class: OfficeWorker do
    sequence(:name)   { |n| "Office Worker #{n}"}
  end
end
