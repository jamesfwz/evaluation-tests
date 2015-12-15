class User < ActiveRecord::Base
  validates :name, presence: true
  validates :dob,  presence: true
end
