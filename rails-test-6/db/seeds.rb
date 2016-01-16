Person.destroy_all

john    = Person.create!(first_name: 'John',    last_name: 'Fwz', dob: 40.years.ago, gender: :male)
lily    = Person.create!(first_name: 'Lily',    last_name: 'Fwz', dob: 38.years.ago, gender: :female)
william = Person.create!(first_name: 'William', last_name: 'Fwz', dob: 18.years.ago, gender: :male)
michael = Person.create!(first_name: 'Michael', last_name: 'Fwz', dob: 15.years.ago, gender: :male)
ava     = Person.create!(first_name: 'Ava',     last_name: 'Fwz', dob: 14.years.ago, gender: :female)
mia     = Person.create!(first_name: 'Mia',     last_name: 'Fwz', dob: 12.years.ago, gender: :female)

[william, michael, ava, mia].each do |person|
  Relationship.create!(person: person, member: john, member_type: Father)
  Relationship.create!(person: person, member: lily, member_type: Mother)
end
