class Person < ActiveRecord::Base
  extend Enumerize
  MIN_AGE = 0

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
