class Person < ActiveRecord::Base
  extend Enumerize

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :dob,        presence: true
  validates :gender,     presence: true

  enumerize :gender, in: [:male, :female], predicates: true
end
