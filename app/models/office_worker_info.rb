class OfficeWorkerInfo < ActiveRecord::Base
  belongs_to :office_worker

  validates :start_working_on, presence: true
  validates :office_worker_id, presence: true
  validate :ensure_valid_years_of_exp

  def years_of_experience
    Date.today.year - start_working_on.year
  end

  private

  def ensure_valid_years_of_exp
    return errors[:start_working_on] << 'Invalid.' if start_working_on? && years_of_experience < 0
  end
end
