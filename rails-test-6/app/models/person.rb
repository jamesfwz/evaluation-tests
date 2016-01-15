class Person < ActiveRecord::Base
  extend Enumerize
  MIN_AGE = 0

  has_one :father_relationship, -> { where(relationships: { member_type: Father }) }, class_name: Relationship
  has_one :father, class_name: Father, through: :father_relationship, source: :member

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :dob,        presence: true
  validates :gender,     presence: true
  validate :ensure_valid_age

  enumerize :gender, in: [:male, :female], predicates: true

  before_save :set_name 

  def age
    ((Date.today - dob) / 365).floor
  end

  private

  def set_name
    self.name = first_name + ' ' + last_name
  end

  def ensure_valid_age
    return errors[:dob] << 'Invalid.' if dob? && age < self.class::MIN_AGE
  end
end
