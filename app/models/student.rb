class Student < User
  has_and_belongs_to_many :schools, join_table: :schools_students

  MIN_AGE = 18
end
