class School < ActiveRecord::Base
  extend Enumerize
  self.inheritance_column = nil

  has_and_belongs_to_many :students, join_table: :schools_students

  validates :name, presence: true
  validates :type, presence: true

  enumerize :type, in: [:primary_school, :secondary_school, :high_school, :university], predicates: true
end
