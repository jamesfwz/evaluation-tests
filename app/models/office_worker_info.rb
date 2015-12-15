class OfficeWorkerInfo < ActiveRecord::Base
  belongs_to :office_worker

  validates :start_working_on, presence: true
  validates :office_worker_id, presence: true
end
