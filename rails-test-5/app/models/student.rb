class Student < User
  has_and_belongs_to_many :schools, join_table: :schools_students
  has_many :schoolmates, -> (object) { merge(Student.where.not(id: object)) }, through: :schools, class_name: Student, source: :students

  MIN_AGE = 18
end
