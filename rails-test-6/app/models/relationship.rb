class Relationship < ActiveRecord::Base
  extend Enumerize
  self.inheritance_column = nil

  belongs_to :person 
  belongs_to :member, class_name: Person

  validates :person_id,  presence: true
  validates :member_id,  presence: true
  validates :type,       presence: true

  enumerize :type, in: [:Father, :Mother], predicates: true
end
