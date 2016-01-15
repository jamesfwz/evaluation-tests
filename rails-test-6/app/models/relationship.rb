class Relationship < ActiveRecord::Base
  extend Enumerize

  belongs_to :person 
  belongs_to :member, class_name: Person

  validates :person_id,     presence: true
  validates :member_id,     presence: true
  validates :member_type,   presence: true

  enumerize :member_type, in: [:Father, :Mother], predicates: true
end
