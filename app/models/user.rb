class User < ActiveRecord::Base
  validates :name, presence: true
  validates :dob,  presence: true
  validate :ensure_valid_age

  MIN_AGE = 0

  def age
    ((Date.today - dob) / 365).floor
  end

  private

  def ensure_valid_age
    return errors[:dob] << 'Invalid.' if dob? && age < MIN_AGE
  end
end
