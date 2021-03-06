FactoryGirl.define do
  factory :relationship do
    person
    association :member, factory: :person
  end

  factory :father_relationship, parent: :relationship  do 
    member_type 'Father'
  end

  factory :mother_relationship, parent: :relationship  do 
    member_type 'Mother'
  end
end
