class Relationship < ActiveRecord::Base
  extend Enumerize

  MIN_AGE = {
    "Father" => 20,
    "Mother" => 18
  }

  belongs_to :person 
  belongs_to :member, class_name: Person

  validates :person_id,     presence: true
  validates :member_id,     presence: true
  validates :person_id,     uniqueness: { scope: :member_type }, if: Proc.new { |relationship| ['Father', 'Mother'].include?(relationship.member_type) }
  validates :member_type,   presence: true
  
  validate :ensure_valid_age

  enumerize :member_type, in: [:Father, :Mother], predicates: true

  private 

  def ensure_valid_age
    return errors[:member_id] << "#{member_type_text} must be over #{MIN_AGE[member_type]}" if member && member.age < MIN_AGE[member_type] 
  end
end
