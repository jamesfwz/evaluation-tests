class School < ActiveRecord::Base
  extend Enumerize
  self.inheritance_column = nil

  validates :name, presence: true
  validates :type, presence: true

  enumerize :type, in: [:primary_school, :secondary_school, :high_school, :university], predicates: true
end
