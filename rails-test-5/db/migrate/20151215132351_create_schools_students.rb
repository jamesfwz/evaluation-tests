class CreateSchoolsStudents < ActiveRecord::Migration
  def change
    create_table :schools_students do |t|
      t.belongs_to :school,  index: true
      t.belongs_to :student, index: true
    end
  end
end
