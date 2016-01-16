class Person < ActiveRecord::Base
  extend Enumerize
  MIN_AGE = 0

  has_one :relationship, dependent: :destroy
  has_one :father, -> { where(relationships: { member_type: Father }) }, class_name: Father, through: :relationship, source: :member
  has_one :mother, -> { where(relationships: { member_type: Mother }) }, class_name: Mother, through: :relationship, source: :member

  has_many :parents,  -> { where(relationships: { member_type: [Father, Mother] }) }, class_name: Parent, through: :relationship, source: :member
  has_many :children_relationships, -> { where(member_type: [Father, Mother]) }, class_name: Relationship, foreign_key: :member_id
  has_many :children,   class_name: Child,    source: :person, through: :children_relationships
  has_many :sons,       class_name: Son,      source: :person, through: :children_relationships
  has_many :daughters,  class_name: Daughter, source: :person, through: :children_relationships
  has_many :brothers, -> (object) { where.not(id: object.id) }, class_name: Brother, source: :sons, through: :parents

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

  def older_than(person)
    age - person.age
  end

  def father_of?(person)
    return false if !father
    father.id == person.id 
  end

  def say_something
    "Hello, my full name is #{name}."
  end

  private

  def set_name
    self.name = first_name + ' ' + last_name
  end

  def ensure_valid_age
    return errors[:dob] << 'Invalid.' if dob? && age < self.class::MIN_AGE
  end
end
